package com.bnova.Producer;

import jakarta.inject.Inject;

import org.apache.avro.specific.SpecificRecord;
import org.eclipse.microprofile.reactive.messaging.Channel;
import org.eclipse.microprofile.reactive.messaging.Emitter;


public class Producer
{
	@Inject
	@Channel("command-topic")
	Emitter<SpecificRecord> commandTopicEmitter;

	public void produce(SpecificRecord record)
	{
		commandTopicEmitter.send(record);
	}
}
