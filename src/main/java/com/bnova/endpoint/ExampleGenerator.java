package com.bnova.endpoint;

import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;

import java.util.List;
import org.apache.avro.specific.SpecificRecord;
import org.eclipse.microprofile.reactive.messaging.Channel;
import org.eclipse.microprofile.reactive.messaging.Emitter;
import com.bnova.Decodify;
import com.bnova.Techup;


@Path(value = "test")
public class ExampleGenerator
{
	@Inject
	@Channel("techhub-topic")
	Emitter<SpecificRecord> commandTopicEmitter;

	@Path("techup/{title}")
	@GET
	public void createExampleTechup(@PathParam("title") String title)
	{
		var techup = Techup
				.newBuilder()
				.setTitle(title)
				.setSlug(title + "-slug")
				.setAuthor("Ricky")
				.setContent("example content for " + title)
				.setDescription("example desciption for " + title)
				.build();

		commandTopicEmitter.send(techup);
	}

	@Path("decodify/{episode}")
	@GET
	public void createExamplePodcast(@PathParam("episode") int eNr)
	{
		var episode = Decodify
				.newBuilder()
				.setEpisode(eNr)
				.setSeason(1)
				.setTopic("Multiple Eventtypes in the same topic")
				.setAttendees(List.of("Ricky", "Stefan", "Tom", "Wasili"))
				.setDescription("This is a decodify episode to talk about multiple diffrent event types in the same Kafka topic")
				.build();

		commandTopicEmitter.send(episode);
	}
}
