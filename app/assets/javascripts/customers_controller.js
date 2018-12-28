Paloma.controller('Customers < Application', {

	notifySave: function(){
        var msg = this.params.msg;

        toastr.options.showMethod = 'fadeIn';
        toastr.options.hideMethod = 'fadeOut';
        toastr.options.closeMethod = 'slideUp';
        toastr.success(msg, 'Application Notice')
    },
    notifyAlive: function(){
        var msg = this.params.msg;

        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-bottom-full-width",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "2500",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }

        toastr.success(msg, 'Application Notice')
    },
});