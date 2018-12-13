Paloma.controller('Customers < Application', {
    notify: function(){
        var msg = this.params['msg'];
        showGritter(msg);
    },
});