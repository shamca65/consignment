Paloma.controller('Application', {

    before: [
        'all -> performThis'
    ],

    performThis: function(){
        console.log('Paloma executing\n');
    }
});
