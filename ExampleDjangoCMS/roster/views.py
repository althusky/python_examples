# To change this template, choose Tools | Templates
# and open the template in the editor.

__author__="husky"
__date__ ="$21.12.2010 0:39:25$"

from roster.models import Roster
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.conf import settings
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.shortcuts import get_object_or_404


def show_list(request, page):
    roster_list = Roster.objects.filter(is_published=True).order_by('-rating')
    paginator = Paginator(roster_list, settings.ROSTER_PAGE) # Show 25 contacts per page
    try:
        roster = paginator.page(page)
    except (EmptyPage, InvalidPage):
        roster = paginator.page(paginator.num_pages)
    return render_to_response('roster/list.html', {"roster": roster} ,context_instance=RequestContext(request))

def show_item(request, item):
    vars = {'roster': get_object_or_404(Roster, id=item)}
    return render_to_response('roster/item.html' ,vars, context_instance=RequestContext(request))