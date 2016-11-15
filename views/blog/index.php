<div class="panel-body">
	<?php foreach ($viewmodel as $item) : ?>
		<div id="blogItem">
			<div>
				<h3><?php echo $item['Title']; ?></h3>
				<h10><?php echo $item['Login'].", ".$item['X_UpdateTime']; ?></h10>
				<p><?php echo $item['Text']; ?></p>
				<p><a href="<?php echo ROOT_PATH; ?>blog/add-comment"> + Dodaj komentarz</a><p>
			</div>
			<br>
		</div>
		<br>
	<?php endforeach; ?>

</div>
