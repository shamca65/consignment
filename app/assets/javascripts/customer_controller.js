Paloma.controller('Customer < Application', {

	notifySave: function(){
		var msg = this.params.msg;

		toastr.options.showMethod = 'fadeIn';
		toastr.options.hideMethod = 'fadeOut';
		toastr.options.closeMethod = 'slideUp';
		toastr.success(msg, 'Application Notice')
	},

});