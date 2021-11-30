<script>
	export let value;
</script>

<section class="total-section">
	<div>
		<h2><slot>Total</slot></h2>
		<p>/ person </p>
	</div>
	<strong>${value.toFixed(2)}</strong>
</section>
