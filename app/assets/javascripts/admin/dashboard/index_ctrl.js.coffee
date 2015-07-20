'use strict'

angular.module('ledxApp').config ($stateProvider) ->
  $stateProvider
    .state('admin.dashboard',
      url: '/dashboard',
      templateUrl: 'admin/dashboard/index.html',
      controller: ($scope) ->
    )