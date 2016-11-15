
//javascripte functions (according to Lerarning PHP, MySQL & JavaSript, 4th Edition)
	function Open(i) 
	{
		return typeof i == 'object' ? i : document.getElementById(i)
		//window.alert('ajaxrequest IS WORKING')
	}
	
	 function checkLogin(login)
    {
		//window.alert('ajaxrequest IS WORKING')
      if (login.value == '')
      {
		  //window.alert('JS IS WORKING')
        Open('info').innerHTML = ''
		//window.alert('ajaxrequest IS WORKING')
        return
      }

      params  = "user=" + login.value
      request = new ajaxRequest()
      request.open("POST", "/aspect/ajax/login_check.php", true)
      request.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
      request.setRequestHeader("Content-length", params.length)
      request.setRequestHeader("Connection", "close")
	  
	 
      request.onreadystatechange = function()
      {
        if (this.readyState == 4)
          if (this.status == 200)
            if (this.responseText != null)
              Open('info').innerHTML = this.responseText
      }
      request.send(params)
    }

    function ajaxRequest()
    {
		//window.alert('ajaxrequest IS WORKING')
		
      try { var request = new XMLHttpRequest() }
      catch(e1) {
        try { request = new ActiveXObject("Msxml2.XMLHTTP") }
        catch(e2) {
          try { request = new ActiveXObject("Microsoft.XMLHTTP") }
          catch(e3) {
            request = false
      } } }
	  //window.alert('ajaxrequest IS WORKING')
      return request
    }
