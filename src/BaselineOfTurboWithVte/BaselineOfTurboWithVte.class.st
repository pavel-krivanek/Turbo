Class {
	#name : #BaselineOfTurboWithVte,
	#superclass : #BaselineOf,
	#category : #BaselineOfTurboWithVte
}

{ #category : #baseline }
BaselineOfTurboWithVte >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		
		spec
	    	baseline: 'ThreadedFFI'
	    	with: [ spec repository: 'github://pharo-project/threadedFFI-Plugin' ].

		spec
	    	baseline: 'SpecGtk'
	    	with: [ spec repository: 'github://pharo-spec/Spec-Gtk' ].

		spec
	    	baseline: 'Vte'
	    	with: [ spec repository: 'github://estebanlm/Spec-VTE' ].

		spec
	    	baseline: 'Units'
	    	with: [ spec repository: 'github://zweidenker/Units:master/src' ].

		spec
			package: 'Turbo-Core';
			package: 'Turbo-Layout';
			package: 'Turbo-Animation';
			package: 'Turbo-Math';
			package: 'Turbo-Canvas';
			package: 'Turbo-Tests';
			package: 'Turbo-Morphic';
			package: 'Turbo-VTE';
			package: 'Spec-Turbo-Widgets';
			package: 'Spec-Turbo-Base';
			package: 'Spec-Turbo-Tests';
			package: 'Spec-Turbo-Examples'.
].
]
