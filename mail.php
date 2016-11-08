<?php require_once 'header.php'; ?>

<div class="container">

<?php
if(isset($_POST['email'])) {
 
	 $to = "tlumikiwent@gmail.com";
	$subject = "Wiadmosc ze strony tlumikiwent.pl";
	 
	 
	 /*
	 
    // EDIT THE 2 LINES BELOW AS REQUIRED
 
    $email_to = "you@yourdomain.com";
 
    $email_subject = "Your email subject line";
 */
     
    function died($error) {
 
        // your error code can go here
		echo "<h2>Przepraszamy, Twoja wiadomość nie została wysłana.<br> Prosimy o poprawę błedu lub przysłanie wiadomości na adres tlumikiwent@gmail.com</h2>";
 
        echo "<p>We are very sorry, but there were error(s) found with the form you submitted. ";
 
        echo "These errors appear below.<br /><br />";
 
        echo $error."<br /><br />";
 
        echo "Please go back and fix these errors.<br /><br /></p>";
 
        die();
 
    }
 
    // validation expected data exists
 
    if(!isset($_POST['company']) ||
 
        !isset($_POST['name']) ||
 
        !isset($_POST['email']) ||
 
        !isset($_POST['phone']) ||
 
        !isset($_POST['message'])) {
 
        died('We are sorry, but there appears to be a problem with the form you submitted.');       
 
    }
 
    $company = $_POST['company']; // required
 
    $name = $_POST['name']; // required
 
    $from = $_POST['email']; // required
 
    $phone = $_POST['phone']; // not required
 
    $message = $_POST['message']; // required
 
     
 
    $error_message = "";
 
    $email_exp = '/^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/';
 
  if(!preg_match($email_exp,$from)) {
 
    $error_message .= 'The Email Address you entered does not appear to be valid.<br />';
 
  }
 
    $string_exp = "/^[A-Za-z .'-]+$/";
 
  if(!preg_match($string_exp,$company)) {
 
    $error_message .= 'The Name you entered does not appear to be valid.<br />';
 
  }
 
  if(!preg_match($string_exp,$name)) {
 
    $error_message .= 'The Last Name you entered does not appear to be valid.<br />';
 
  }
 
  if(strlen($message) < 2) {
 
    $error_message .= 'The Comments you entered do not appear to be valid.<br />';
 
  }
 
  if(strlen($error_message) > 0) {
 
    died($error_message);
 
  }
 

    function clean_string($string) {
 
      $bad = array("content-type","bcc:","to:","cc:","href");
 
      return str_replace($bad,"",$string);
 
    }
 
    $email_message = "Nazwa firmy: ".clean_string($company)."\n";
    $email_message .= "Imie i nazwisko: ".clean_string($name)."\n";
    $email_message .= "e-mail: ".clean_string($from)."\n";
    $email_message .= "Tel.: ".clean_string($phone)."\n\n";
    $email_message .= "Tresc wiadomosci: "."\n".clean_string($message)."\n";
	$headers = "From: ".$from ;
}

@mail($to, $subject, $email_message, $headers);  
echo "<h2>Twoja wiadomość została wysłana. Skontaktujemy się z Tobą.</h2>";

?>
</form>
</div>

<div class="container"> 
<div class="row">
    <div class="col-sm-10">
      <div class="panel panel-primary">
        <div class="panel-heading">Dział Sprzedaży</div>
        <div class="panel-body"> 
		mail: tlumikiwent@gmail.com</div>
      </div>
    </div>
  </div>   
  <div class="row">
    <div class="col-sm-10">
      <div class="panel panel-primary">
        <div class="panel-heading">Dane kontaktowe</div>
        <div class="panel-body"> <strong>Akustyka - PRO </strong>
		Krzysztof Leo<br>
		Techniczna 9<br>
		81-528 Gdynia<br>
		tel: +48 530 850 300<br>
		mail: krzysztof.leo@gmail.com<br>
		NIP: 5851363107
		</div>
      </div>
    </div>
  </div>
</div>
<br>


<?php require_once 'footer.php'; ?>


