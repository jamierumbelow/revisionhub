#called in the home controller
#written by jack franklin

$ ->
    #make an etherpad (test)
    $("#padtest").pad
		'host' : 'http://10.30.201.4:9001',
        'padId' : 'test',
        'userName' : $('body').attr 'data-current-user-name'
