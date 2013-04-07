app = angular.module("StEnki", ["ngResource"])

angular.module("scroll", []).directive "whenScrolled", ->
  (scope, elm, attr) ->
    alert( elm )
    raw = elm[0]
    elm.bind "scroll", ->
      scope.$apply attr.wh

app.factory "Widget", ["$resource", ($resource) ->
  $resource("/widgets/:id", {id: "@id"}, {update: {method: "PUT"}})
]

@RaffleCtrl = ["$scope", "Widget", ($scope, Widget) ->
  $scope.widgets = Widget.query()
  
  $scope.addWidget = ->
    widget = Widget.save($scope.newWidget)
    $scope.widgets.push(widget)
    $scope.newWidget = {}
    
  $scope.drawWinner = ->
    pool = []
    angular.forEach $scope.widgets, (widget) ->
      pool.push(widget) if !widget.winner
    if pool.length > 0
      widget = pool[Math.floor(Math.random()*pool.length)]
      widget.winner = true
      widget.$update()
      $scope.lastWinner = widget
]

app.factory "Post", ["$resource", ($resource) ->
  $resource("/posts/:id", {id: "@id"}, {update: {method: "PUT"}})
]

@PostCtrl = ["$scope", "Post", ($scope, Post) ->
  $scope.posts = Post.query()

    
  $scope.drawWinner = ->
    pool = []
    angular.forEach $scope.posts, (post) ->
      pool.push(post) if !post.winner
    if pool.length > 0
      post = pool[Math.floor(Math.random()*pool.length)]
      post.winner = true
      post.$update()
      $scope.lastWinner = post
]

@MiscCtrl = ($scope) ->
  $scope.items = []
  counter = 0

  $scope.loadMore = ->
    i = 0
    while i < 5
      $scope.items.push id: counter
      counter += 10
      i++

  $scope.loadMore()



