 #-*- coding:utf-8 -*-
import curses as crs
import json 


FILE_NAME = 'data_json.txt'

class TableData(object):

  def __init__(self):
    self.load() #self._clear_tb_()

  def _clear_tb_(self):
    self.rw = ['Adata', 'summa1', 'Bdata', 'summa2', 'Cdata', 'summa3', 'summa']
    self.prt_rw = ['summa1', 'summa2','summa3', 'summa']
    self.cl = ['Agroup', 'AAgroup', 'summaA']
    self.prt_cl = ['summaA']

  def get(self, rw, cl):
    line = self.dt.get( rw , False) 
    return line.get( cl , 0) if line else 0

  def put(self, rw, cl, value):
    if not self.dt.get( rw , False): self.dt[rw] = {}
    self.dt[rw][cl] = value

  def add_col(self, name, pos): self.cl.insert(pos, name)

  def add_row(self, name, pos): self.rw.insert(len(self.rw)-2 if pos>=len(self.rw)-2 else pos, name)

  def del_row_col(self, pos, r):
    if not r and not self.cl[pos] in self.prt_cl:
        for i in self.rw:
          if self.dt.get(i, False) and self.dt[i].get(self.cl[pos], False): del self.dt[i][self.cl[pos]]
        del self.cl[pos]
    if r and not self.rw[pos] in self.prt_rw:
      if self.get(self.rw[pos], False): del self.dt[self.rw[pos]]
      del self.rw[pos]
    self.calc()        

  def save(self):
    with open('main.dat','w+') as fl:
      fl.write(json.dumps([self.rw, self.prt_rw, self.cl, self.prt_cl, self.dt]))

  def load(self):
    with open('main.dat','r') as fl:
      self.rw, self.prt_rw, self.cl, self.prt_cl, self.dt = json.loads(fl.read())

  def calc(self):
    # суммируем строки
    for r in self.rw: self.put(r, self.prt_cl[0], reduce(lambda x,y : x+y, 
        [self.get(r, c) for c in self.cl if not c in self.prt_cl], 0))
    # суммируем столбцы
    for c in self.cl:
      sum = 0.0
      for r in self.rw:
        if r in self.prt_rw[0:-1]:
          self.put(r, c, sum)
          sum = 0.0
        else:
          sum += self.get(r, c)
    for c in self.cl: self.put(self.prt_rw[-1], c, reduce(lambda x,y: x+y, 
        [self.get(r, c) for r in self.prt_rw[0:-1]], 0))

class Screen(object):
  ey, ex = 1, 1 #  позиция выделенной ячейки в окне
  def __init__(self ): 
    self.win, self.dt = crs.initscr(), TableData()
    self._main_loop_()

  def _check_size_(self): return True if self.max_x>22 and self.max_y>5 else False
      # определяет минимальный размер окна
  def draw_rect( self, h, w ): # рисует рамку в центре
    s_y, s_x = (self.max_y-2-h)/2, (self.max_x-2-w)/2
    wd = self.win
    wd.addch(s_y,s_x, crs.ACS_ULCORNER)
    rw, rh = range(1,w+1), range(1,h+1)
    map(lambda x: wd.addch(s_y, s_x+x, crs.ACS_HLINE), rw)
    wd.addch(s_y,s_x+w+1, crs.ACS_URCORNER)
    map(lambda i: wd.addch(s_y+i, s_x, crs.ACS_VLINE), rh)
    map(lambda i: wd.addch(s_y+i, s_x+w+1, crs.ACS_VLINE), rh)
    wd.addch(s_y+h+1, s_x, crs.ACS_LLCORNER)
    map(lambda x: wd.addch(s_y+h+1, s_x+x, crs.ACS_HLINE), rw)
    wd.addch(s_y+h+1, s_x+w+1, crs.ACS_LRCORNER)
    return s_x, s_y

  def say_msg(self, txt):
    x,y = self.draw_rect(1, len( txt ))
    self.win.addstr( y+1, x+1, txt )

  def say_help(self, txt=None):
    txt = txt.ljust(self.max_x,'_') if txt else "_"*self.max_x
    for i in range(0, self.max_x):
      self.win.insch(self.max_y-1, i, crs.ACS_CKBOARD if txt[i]=='_' else txt[i])

  def _mark_cell_(self, y, x, mark, mark_r = None): # помечаем ячейку
    self.win.addch(y*2+2, x*10, mark)
    self.win.addch(y*2+2, x*10+10, mark_r if mark_r else mark)

  def draw_back(self):
    self.win.clear()
    if not self._check_size_():
      self.win.addstr(0, 0, 'More space need!')
      return
    def put_data(y, x, value): self.win.addstr(y*2+2, x*10+1, value)    
    def hunder(y, x): map(lambda i: self.win.addch(y, x+i, crs.ACS_HLINE), range(1,10))
    def hborder(i, y, inC):
      hunder(y, i*10)
      self.win.addch(y ,i*10+10, inC)            
    def vborder(i, y, inC):    
      self.win.addch( i*2+2, y, crs.ACS_VLINE )
      self.win.addch( i*2+3, y, inC)
    crs.curs_set(0)
    crs.noecho()
    self.win.keypad(1)
    map(lambda x: self.win.insch(0, x, crs.ACS_CKBOARD), range(0,self.max_x))
    self.say_help('_ Exit: Ctr-x _ Edit Cell: Enter __Add Col: c _Delete Col: v __ Add Row: r _ Delete row: t')
    # проверяем что больше размер экрана или число строк
    rowC = len(self.dt.rw)+1 # под название колонок
    self.rowC =  rowC if rowC < (self.max_y-3)/2 else  (self.max_y-3)/2
    if self.ey >= self.rowC: self.ey = self.rowC-1
    colC = len(self.dt.cl)+1 # под название строк
    self.colC = colC if colC < (self.max_x-2)/10 else (self.max_x-2)/10
    if self.ex >= self.colC: self.ex = self.colC-1
    #  рисуем тело таблицы 
    rn_rw, rn_cl = range(0, self.rowC), range(0, self.colC)   
    for r in rn_rw:
      for c in rn_cl:
        self.win.addch( r*2+2, c*10+10, crs.ACS_VLINE )
        hunder(r*2+3, c*10)    
        self.win.addch( r*2+3, c*10+10, crs.ACS_PLUS )
        if r<self.rowC-1 and c<self.colC-1: # пишем данные
          val = self.dt.get(self.dt.rw[r+self.wy], self.dt.cl[c+self.wx])
          put_data( r+1 , c+1, "%.2f" % val)                
    # левый верх правый низ
    map(lambda x: vborder(x, 0, crs.ACS_LTEE), rn_rw)
    map(lambda x: hborder(x, 1, crs.ACS_TTEE), rn_cl)
    map(lambda x: vborder(x, self.colC*10, crs.ACS_RTEE), rn_rw)
    map(lambda x: hborder(x, self.rowC*2+1, crs.ACS_BTEE), rn_cl)
    # углы
    self.win.addch(1, 0, crs.ACS_ULCORNER)
    self.win.addch(self.rowC*2+1, 0, crs.ACS_LLCORNER) 
    self.win.addch(1, self.colC*10, crs.ACS_URCORNER)
    self.win.addch(self.rowC*2+1, self.colC*10, crs.ACS_LRCORNER)
    # заполняем  заголовки
    map(lambda i: put_data(0, i, self.dt.cl[i-1+self.wx]), rn_cl[1:])
    map(lambda i: put_data(i, 0, self.dt.rw[i-1+self.wy]), rn_rw[1:])
    # выделяем закрытые 
    for c in rn_cl[:-1]:
      if self.dt.cl[c+self.wx] in self.dt.prt_cl:
        map(lambda x: self._mark_cell_(x, c+1, "*"), rn_rw[:-1])
    for r in rn_rw[:-1]:
      if self.dt.rw[r+self.wy] in self.dt.prt_rw:
        map(lambda x: self._mark_cell_(r+1, x, "*"), rn_cl)
    self.move_select_cell(0, 0)

  def move_select_cell(self, y, x): 
    oedy, oedx = self.ey, self.ex
    self.ey, self.ex = self.ey+y, self.ex+x 
    if not( 0< self.ey < self.rowC): #  проверяем что бы не вылазил за пределы
      self.ey = oedy
      if y < 0 and self.wy > 0: self.wy += -1
      if y > 0 and self.wy+self.ey < len(self.dt.rw): self.wy += 1
    if not( 0< self.ex < self.colC): #  проверяем что бы не вылазил за пределы
      self.ex = oedx
      if x < 0 and self.wx > 0: self.wx += -1
      elif x > 0 and self.wx+self.ex < len(self.dt.cl): self.wx += 1
    self.win.addstr(0, 1, ' x:%2i:%2i+%2i  y:%2i:%2i+%2i ' % \
        (len(self.dt.cl), self.wx, self.ex,
         len(self.dt.rw), self.wy, self.ey))
    if x!=0 or y!=0:  
      self.draw_back()
    self._mark_cell_(self.ey, self.ex, '>', '<') 

  def _enter_(self, vl, type='C'):
    NUMBERS = range(48,58)+[46]
    CHARS = range(97,123)+range(65,94)
    def ins_kod(vl_in, kod_in, pos_in):
      if len(vl_in)<9:
        vl_ = list(vl_in.rjust(9))
        for i in range(1,pos_in+1): vl_[i-1] = vl_[i]
        vl_[pos_in]=chr(kod_in)
        return (''.join(vl_)).strip()
      return vl_in
    def test_number(vl_in):
      arr = vl_in.split('.')
      if len(arr)<2: return True
      if len(arr)==2 and len(arr[1])<=2: return True
      return False
    crs.curs_set(2)
    self.draw_rect(1, 9)
    pos = 8
    s_y, s_x = (self.max_y-3)/2+1, (self.max_x-11)/2+1
    self.win.addstr(s_y, s_x, str(vl).rjust(9))
    self.win.move(s_y, s_x+pos)
    while True:
      kd = self.win.getch()
      if kd == crs.KEY_LEFT and pos > 9-len(vl): pos += -1
      if kd == crs.KEY_RIGHT and pos < 8: pos += 1
      if kd == crs.KEY_BACKSPACE and len(vl)>0:
        vl_ = list(vl.rjust(9))
        del vl_[pos]
        vl = (''.join(vl_)).strip()
        if pos < 8-len(vl): pos = 8-len(vl)
      if kd == 27: return None
      if kd == 10: return vl
      if type=='N' and kd in NUMBERS:
        vl_ = ins_kod(vl, kd, pos)
        vl = vl_ if test_number(vl_) else vl
      if type=='C'and kd in CHARS: vl = ins_kod(vl, kd, pos)
      self.win.addstr(s_y, s_x, str(vl).rjust(9))
      self.win.move(s_y, s_x+pos)

  def edit_cell(self): 
    self.say_help('_ 0-9 . _ format xxxxxx.xx _ Enter: Enter _ Cancel: ESC _')
    row_nm = self.dt.rw[self.wy+self.ey-1]
    col_nm = self.dt.cl[self.wx+self.ex-1]
    if row_nm in self.dt.prt_rw or col_nm in self.dt.prt_cl:
      self.say_msg("Protected cell. press ESC")
      while self.win.getch() != 27: pass
    else:
      vl = self._enter_("%.2f" % self.dt.get(row_nm, col_nm) ,"N")
      if vl: self.dt.put(row_nm, col_nm, float(vl))
      self.dt.calc()

  def add_col(self):
    self.say_help('_ A-Z a-z _ Enter: Enter _ Cancel: ESC _')
    vl = self._enter_('')
    while vl and vl in self.dt.cl:
      self.say_help(' Error! Same col name ! ')
      vl = self._enter_(vl)
    if vl: self.dt.add_col(vl, self.wx+self.ex-1) 

  def del_col(self):
    pos = self.wx+self.ex-1
    nm = self.dt.cl[pos]
    if nm in self.dt.prt_cl: return 
    self.say_help(str('for delete col '+nm+' type "yes"'))
    if "yes" == self._enter_('',"C") : self.dt.del_row_col(pos, False)

  def add_row(self):
    self.say_help('_ A-Z a-z _ Enter: Enter _ Cancel: ESC _')
    vl = self._enter_('')
    while vl and vl in self.dt.rw:
      self.say_help(' Error! Same row name ! ')
      vl = self._enter_(vl)
    if vl: self.dt.add_row(vl, self.wy+self.ey-1) 

  def del_row(self):
    pos = self.wy+self.ey-1
    nm = self.dt.rw[pos]
    if nm in self.dt.prt_rw: return
    self.say_help(str('for delete row '+nm+' type "yes"'))
    if "yes" == self._enter_('',"C"): self.dt.del_row_col(pos, True)         

  def _main_loop_(self):        
    kd = crs.KEY_RESIZE
    while kd != 24:
      if kd == crs.KEY_RESIZE:
        self.max_y, self.max_x = self.win.getmaxyx()
        self.wy, self.wx = 0, 0 
        self.draw_back()
      kd = self.win.getch()
      if self._check_size_(): #self.win.addstr(0,0, "%s" % kd)
        if kd == 10: self.edit_cell()# enter
        if kd == crs.KEY_UP: self.move_select_cell(-1, 0)
        if kd == crs.KEY_DOWN: self.move_select_cell(1, 0)
        if kd == crs.KEY_RIGHT: self.move_select_cell(0, 1)
        if kd == crs.KEY_LEFT: self.move_select_cell(0, -1)
        if kd == 114: self.add_row()#r
        if kd == 116: self.del_row()#t
        if kd == 99: self.add_col()#c
        if kd == 118: self.del_col()#v
        if kd in [114, 116, 99, 118, 10]: self.draw_back()
    self.say_msg('Closed...')
    self.win.refresh()
      
  def __del__(self):
    self.dt.save()
    crs.delay_output(5000)
    crs.endwin()    

if __name__ == '__main__':
  Screen() 