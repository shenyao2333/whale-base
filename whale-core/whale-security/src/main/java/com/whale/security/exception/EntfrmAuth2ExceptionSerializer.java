package com.whale.security.exception;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;
import lombok.SneakyThrows;

/**
 * @author shenyao
 * @date 2019/11/16
 * <p>
 * OAuth2 异常格式化
 */
public class EntfrmAuth2ExceptionSerializer extends StdSerializer<whaleAuth2Exception> {
	public EntfrmAuth2ExceptionSerializer() {
		super(whaleAuth2Exception.class);
	}

	@Override
	@SneakyThrows
	public void serialize(whaleAuth2Exception value, JsonGenerator gen, SerializerProvider provider) {
		gen.writeStartObject();
		gen.writeObjectField("code", "1");
		gen.writeStringField("msg", value.getMessage());
		gen.writeStringField("data", value.getOAuth2ErrorCode());
		gen.writeEndObject();
	}
}
