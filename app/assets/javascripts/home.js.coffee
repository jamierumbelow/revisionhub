#called in the home controller
#written by jack franklin

$ ->
    #make an etherpad (test)
    $("#padtest").pad
        'host' : 'http://10.0.2.2:9001',
        'padId' : 'test',
        'showControls' : true
    
