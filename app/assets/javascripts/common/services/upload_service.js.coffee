angular.module('ledxApp').factory "UploadService", (Restangular) ->
  new class Upload
    constructor: ->

    all: (params) ->
      Restangular.all("uploads").getList(params)

    create: (attrs) ->
      formData = new FormData()
      formData.append 'upload[file]', attrs.file
      formData.append 'upload[description]', attrs.description

      restangular = Restangular.all("uploads")
      restangular
        .withHttpConfig(transformRequest: angular.identity)
        .customPOST(formData, '', undefined, {'Content-Type': undefined})

    import: (id) ->
      Restangular.one('uploads', id).customPOST({}, 'import')
