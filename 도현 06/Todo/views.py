from django.shortcuts import render, redirect
from django.views.decorators.http import require_http_methods, require_POST, require_safe
from django.contrib.auth.decorators import login_required
# from django.http import HttpResponse, HttpResponseForbidden
from .models import Todo
from .forms import TodoForm

# Create your views here.

@require_safe
def index(request):
    Todo_list = Todo.objects.all()
    context = {
        'Todo_list': Todo_list,
    }
    return render(request, 'Todo/index.html', context)


@login_required
@require_http_methods(['GET', 'POST'])
def new(request):
    if request.method == 'POST':
        form = TodoForm(request.POST)
        if form.is_valid():
            article = form.save(commit=False)
            article.user = request.user
            article.save()
            return redirect('Todo:index')
    else:
        form = TodoForm()
    context = {
        'form': form,
    }
    return render(request, 'Todo/new.html', context)