var Lock = function () {

    return {
        //main function to initiate the module
        init: function () {

             $.backstretch([
		        "../uaassets/img/bg/1.jpg",
		        "../uaassets/img/bg/2.jpg",
		        "../uaassets/img/bg/3.jpg",
		        "../uaassets/img/bg/4.jpg"
		        ], {
		          fade: 1000,
		          duration: 8000
		      });
        }

    };

}();