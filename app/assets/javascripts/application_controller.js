Paloma.controller('Application', {

    before: [
        'all -> performThis'
    ],

    performThis: function(){
    }
});