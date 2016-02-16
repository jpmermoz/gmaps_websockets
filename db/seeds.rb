event_categories = EventCategory.create([
	{ key: 'low', name: 'Low Priority', alert_duration: 5, color: '#23960F' },
	{ key: 'med', name: 'Medium Priority', alert_duration: 10, color: '#EE8E11' },
	{ key: 'high', name: 'High Priority', alert_duration: 15, color: '#E71A1A' }
])