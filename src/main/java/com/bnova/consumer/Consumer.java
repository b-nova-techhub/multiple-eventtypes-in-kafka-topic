package com.bnova.consumer;

import lombok.extern.jbosslog.JBossLog;

import org.apache.avro.specific.SpecificRecord;
import org.eclipse.microprofile.reactive.messaging.Incoming;
import com.bnova.Decodify;
import com.bnova.Techup;


@JBossLog
public class Consumer
{
	@Incoming("techhub")
	public void process(SpecificRecord record)
	{
		log.info(record.getClass().getName());

		if (record instanceof Techup techup)
		{
			log.info(techup.getTitle());
			log.info(techup.getSlug());
			log.info(techup.getAuthor());
			log.info(techup.getContent());
			log.info(techup.getDescription());
		}
		else if (record instanceof Decodify decodify)
		{
			log.info(decodify.getEpisode());
			log.info(decodify.getSeason());
			log.info(decodify.getTopic());
			log.info(decodify.getAttendees());
			log.info(decodify.getDescription());
		}
	}
}
