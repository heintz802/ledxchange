angular.module('ledxApp').directive "fileread", () ->
  scope:
    fileread: '='
  link: (scope, element, attrs) ->
    element.bind 'change', (changeEvent) ->
      scope.$apply ->
        scope.fileread = changeEvent.target.files[0]
