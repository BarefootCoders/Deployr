class Deployr.ProjectsController extends Deployr.ApplicationController
  routingKey: 'projects'

  index: (params) ->
    @set('projects', Deployr.Project.get('all'))

  show: (params) ->
    Deployr.Project.find params.id, @errorHandler (project) =>
      @set('post', post)

  edit: (params) ->

  new: (params) ->

  create: (params) ->

  update: (params) ->

  destroy: (params) ->

