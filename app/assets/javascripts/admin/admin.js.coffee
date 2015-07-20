'use strict'

angular.module('ledxApp', [
  'restangular'
  'ui.router'
  'templates'
  'ngFileUpload'
])

angular.module('ledxApp').config ['$httpProvider', ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
  $httpProvider.defaults.headers.common.Accept = 'application/json'
]
.config ["RestangularProvider", (RestangularProvider) ->
  RestangularProvider.setBaseUrl("/api/v1")
]

angular.module('ledxApp').config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/admin/dashboard')

  $stateProvider
    .state('admin',
      url: '/admin'
      template: '<ui-view/>'
    )
