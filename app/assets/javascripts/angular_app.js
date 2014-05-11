var myApp = angular.module('myApp', []);

myApp.controller('IndexController', function ($scope, $http) {
  $http.get('/cities.json').success(function(data) {
    $scope.cities = data;
  });
});
