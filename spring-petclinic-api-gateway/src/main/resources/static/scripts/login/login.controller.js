'use strict';

angular.module('login')
    .controller('loginController', ["$http",'$location', '$state','$stateParams', function ($http,$location, $state,$stateParams) {
        var self = this;
        var username=getCookie("username");
        if (username!==""){
            $state.go('welcome');
            alert("欢迎 " + username + " 再次访问,您已登录！");
        }

        self.submitlogin = function () {

            const username=this.username;
            const password=this.password;
            console.log("表单传值 :"+username+"  "+password)

            $http.get('api/gateway/sign/' + username).then(function (resp) {
                self.user=resp.data;
                console.log("self.user.username :"+self.user.username+" self.user.pass "+self.user.password)
                const re= (password!==self.user.password)
                if (re) {
                    $state.go('loginNew');
                    alert("登录失败!")
                } else {
                    setCookie("username",username,5);
                    console.log("setcookie :"+getCookie('username'))
                    $state.go('welcome');
                    alert("登录成功!")
                }
            });

        };
    }]);
