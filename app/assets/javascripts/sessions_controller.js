Paloma.controller('Sessions < Application', {
    notify: function(){
        var msg = this.params['msg'];
        showGritter(msg);
    },
});