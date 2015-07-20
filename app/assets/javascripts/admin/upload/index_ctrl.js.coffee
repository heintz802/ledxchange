'use strict'

angular.module('ledxApp').config ($stateProvider) ->
  $stateProvider
    .state('admin.upload',
      url: '/upload',
      resolve:
        uploads: (UploadService)->
          UploadService.all()

      templateUrl: 'admin/upload/index.html',
      controller: ($scope, uploads, Restangular, UploadService) ->
        $scope.description = ""

        $scope.currentStep = 'types'
        $scope.stepDescriptions = 
          types: 'Select Import Types'
          select_file: 'Select File to Import'
          manual: 'Manual Product Import'
          new_upload: 'New Upload'
        $scope.uploads = uploads
        $scope.upload = {}
        $scope.message = ''

        $scope.gotoStep = (step) ->
          $scope.message = ''
          $scope.currentStep = step

        $scope.uploadFile = ->
          UploadService.create($scope.upload).then(
            (res) ->
              $scope.uploads.push res
              $scope.message = "You successfully uploaded new file"
            (errors) ->
              $scope.message = "Failed to upload new file."
          )

        $scope.importFile = (id) ->
          UploadService.import(id).then(
            (res) ->
              $scope.message = res.message
            (errors) ->
              $scope.message = errors.data.message
          )

        # TODO: change to angular filter
        $scope.getFileName = (path) ->
          path.replace(/^.*[\\\/]/, '')
    )