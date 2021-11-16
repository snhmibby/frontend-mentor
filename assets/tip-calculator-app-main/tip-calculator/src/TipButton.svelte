<script>
	import {tipPercent} from './globalStore.js'
	export let tip;

	function click() {
		tipPercent.update(() => tip)
	}
</script>

<button on:click={click}>{tip}%</button>
