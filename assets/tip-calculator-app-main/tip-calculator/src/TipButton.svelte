<script>
	import {tipPercent} from './globalStore.js'
	export let tip;

	function click() {
		tipPercent.update(() => tip)
	}
</script>

{#if $tipPercent==tip}
	<button on:click={click} class="active">{tip}%</button>
{:else}
	<button on:click={click}>{tip}%</button>
{/if}
