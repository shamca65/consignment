Paloma.controller('Static < Application', {
    notify: function(){
        var msg = this.params['msg'];
        showGritter(msg);
    },
});
