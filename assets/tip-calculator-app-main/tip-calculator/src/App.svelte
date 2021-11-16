<script>
	import {tipPercent} from './globalStore.js';
	import TipButton from './TipButton.svelte';
	import Total from './Total.svelte'
	let bill = 0
	let persons = 1
	$: tipPerPerson = bill/100 * $tipPercent/persons
	$: totPerPerson = (bill/persons) + tipPerPerson

	function reset() {
		bill = 0;
		persons = 1;
		tipPercent.update(() => 15)
	}
</script>

<article class="tip-calculator">
	<!--<h1>Hello, you are tippin' {$tipPercent}% of ${bill}, with {persons} person{persons == 1 ? "" : "s"} which is ${tipPerPerson}/person</h1>
	-->

	<section class="inputs">
		<label for="bill-input">Bill</label>
		<input id="bill-input" type=number bind:value={bill} step="0.01" min=0>

		<label>Select Tip %</label>
		<section class="tip-buttons">
			<TipButton tip={5}  />
			<TipButton tip={10} />
			<TipButton tip={15} />
			<TipButton tip={25} />
			<TipButton tip={50} />
			<input id="custom-tip" type=number bind:value={$tipPercent} min=0>
		</section>

		<label for="person-input">Number of people</label>
		<input id="person-input" type=number bind:value={persons} min=1>
	</section>
	<section class="output">
		<Total value={tipPerPerson}>Tip Amount</Total>
		<Total value={totPerPerson}/>
		<button on:click={reset} class="reset-button">RESET</button>
	</section>

</article>

