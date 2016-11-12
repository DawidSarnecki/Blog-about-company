
<h2> Nowy Wpis </h2>
			<form class="form-horizontal" role="form2" method="post" action="<?php $_SERVER['PHP_SELF']; ?>" >
				<div class="form-group">
				  <label for="title" class="control-label col-sm-2">Tytuł:</label>
				  <div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="title" placeholder="Dodaj tytuł..." value="" />
					</div>
				</div>
				<div class="form-group">
				  <label for="message" class="control-label col-sm-2" >Treść:</label>
				 <div class="col-sm-10">          
					<textarea name="body" rows="4" cols="50" placeholder="Dodaj treść..." class="form-control"></textarea>
				</div>
				</div>
				<div class="form-group">        
				<div class="col-sm-offset-2 col-sm-2">
				<input  class="form-control" type="submit" name="add" value ="Dopdaj wpis" /> 
				</div>
				</div>
			</form>
			</br>
			</br>
			</div>	