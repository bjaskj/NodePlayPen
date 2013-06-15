@UserController = ($scope, $http) ->
    $http.get('/users').success( (data) ->
        $scope.users = data
    )
