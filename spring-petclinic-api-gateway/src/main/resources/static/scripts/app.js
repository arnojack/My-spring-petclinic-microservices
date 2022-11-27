'use strict';
/* App Module */
var petClinicApp = angular.module('petClinicApp', [
    'ui.router', 'ui.router.state.events', 'infrastructure', 'layoutNav', 'layoutFooter', 'layoutWelcome',
    'ownerList', 'ownerDetails', 'ownerForm', 'petForm', 'visits', 'vetList',
    'login']);

petClinicApp.config(['$stateProvider', '$urlRouterProvider', '$locationProvider', '$httpProvider', function (
    $stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) {

    // safari turns to be lazy sending the Cache-Control header
    $httpProvider.defaults.headers.common["Cache-Control"] = 'no-cache';
    $httpProvider.interceptors.push('HttpErrorHandlingInterceptor');

    $locationProvider.hashPrefix('!');

    $urlRouterProvider.otherwise('/welcome');
    $stateProvider
        .state('app', {
            abstract: true,
            url: '',
            template: '<ui-view></ui-view>'
        })
        .state('welcome', {
            parent: 'app',
            url: '/welcome',
            template: '<layout-welcome></layout-welcome>'
        });


}]).run(function($rootScope, $state) {
    $rootScope.$state = $state; //Get state info in view

    if(getCookie("username")===""){
        $state.go("loginNew");
        alert("请登录!");
    }

    //Check session and redirect to specific page
    $rootScope.$on('$stateChangeStart', function(event, toState){

        if(getCookie("username")==="" && toState && toState.name!=='loginNew'){

            event.preventDefault();
            $state.go("loginNew");
            alert("请登录!");
        }
    });

});

['welcome', 'nav', 'footer'].forEach(function (c) {
    var mod = 'layout' + c.toUpperCase().substring(0, 1) + c.substring(1);
    angular.module(mod, []);
    angular.module(mod).component(mod, {
        templateUrl: "scripts/fragments/" + c + ".html"
    });
});


function setCookie(cname,cvalue,exmin){
    var d = new Date();
    d.setTime(d.getTime()+(exmin*60*1000));
    var expires = "expires="+d.toGMTString();
    document.cookie = cname+"="+cvalue+"; "+expires;
}
function getCookie(cname){
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i].trim();
        if (c.indexOf(name)===0) { return c.substring(name.length,c.length); }
    }
    return "";
}
function deleteCookie(cname){
    var d = new Date();
    d.setTime(d.getTime()-(24*60*60*1000));
    var expires = "expires="+d.toGMTString();
    document.cookie = cname+"= ; "+expires;
}
