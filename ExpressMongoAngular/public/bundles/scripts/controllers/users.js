this.UserController = function($scope, $http) {
  return $http.get('/users').success(function(data) {
    return $scope.users = data;
  });
};
