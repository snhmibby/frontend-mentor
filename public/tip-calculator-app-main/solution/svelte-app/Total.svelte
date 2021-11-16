<script>
	export let value;
</script>

<section class="total-section">
	<h2><slot>Total</slot></h2>
	<p>/ person </p>
	<strong>${value.toFixed(2)}</strong>
</section>
