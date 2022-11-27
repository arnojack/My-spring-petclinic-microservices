'use strict';

angular.module('login', ['ui.router'])
    .config(['$stateProvider', function ($stateProvider) {
        $stateProvider
            .state('loginNew', {
                parent: 'app',
                url: '/sign',
                template: '<login></login>'
            })
            .state('loginEdit', {
                parent: 'app',
                url: '/sign/:username',
                template: '<login></login>'
            })
    }]);
