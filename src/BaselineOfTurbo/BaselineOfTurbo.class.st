Class {
	#name : #BaselineOfTurbo,
	#superclass : #BaselineOf,
	#category : #BaselineOfTurbo
}

{ #category : #baseline }
BaselineOfTurbo >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		
		spec
	    	baseline: 'Units'
	    	with: [ spec repository: 'github://zweidenker/Units:master/src' ].

		spec
			package: #Bloc;
			package: #'Bloc-Layout';
			package: #'Bloc-Animation';
			package: #'Sparta-Math';
			package: 'TextBloc-Core';
			package: 'TextBloc-Tests';
			package: 'Spec-TextBlocAdapters-Widgets';
			package: 'Spec-TextBlocAdapters-Base';
			package: 'Spec-TextBloc-Tests';
			package: 'Spec-TextBloc-Examples'.
].
]
