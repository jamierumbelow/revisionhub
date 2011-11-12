#called in the home controller
#written by jack franklin

$ ->
    #make an etherpad (test)
    $("#padtest").pad
        'padId' : 'test',
        'userName' : $('body').attr 'data-current-user-name'
