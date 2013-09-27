/*
kms-interface: Thrift interfaces for mediaserver
Copyright (C) 2013 Tikal Technologies

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 3
as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

namespace java com.kurento.kms.thrift.api
namespace cpp kurento
namespace * Kurento

include "mediaServer.thrift"

struct KmsEvent {
  1: string type, //Type of event, which does not need to be uniquely associated to a given data type.
  2: optional binary data,
  3: mediaServer.MediaObjectRef source
}

struct KmsError {
  1: string type,
  2: string description,
  3: i32 errorCode
  4: mediaServer.MediaObjectRef source
}

service MediaHandlerService {
	void onEvent(1: string callbackToken, 2: KmsEvent event);
	void onError(1: string callbackToken, 2: KmsError error);
}
