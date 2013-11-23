class Deployr.Project extends Batman.Model
  @resourceName: 'projects'
  @storageKey: 'projects'

  @persist Batman.RailsStorage

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  # @encode 'name'
  @encodeTimestamps()

