--Generated By protoc-gen-lua Do not Edit
local protobuf = require "Framework.Net.Protobuf.protobuf"
local _M = {}

_M.ONE_CMD = protobuf.Descriptor();
_M.ONE_CMD_CMD_ID_FIELD = protobuf.FieldDescriptor();
_M.ONE_CMD_UID_FIELD = protobuf.FieldDescriptor();
_M.ONE_CMD_CMD_DATA_FIELD = protobuf.FieldDescriptor();
_M.NTF_BATTLE_FRAME_DATA = protobuf.Descriptor();
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME = protobuf.Descriptor();
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_SERVER_FRAME_FIELD = protobuf.FieldDescriptor();
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_CMD_FIELD = protobuf.FieldDescriptor();
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT = protobuf.Descriptor();
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_SLOT_FIELD = protobuf.FieldDescriptor();
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_CMD_LIST_FIELD = protobuf.FieldDescriptor();
_M.NTF_BATTLE_FRAME_DATA_TIME_FIELD = protobuf.FieldDescriptor();
_M.NTF_BATTLE_FRAME_DATA_SLOT_LIST_FIELD = protobuf.FieldDescriptor();
_M.NTF_BATTLE_FRAME_DATA_SERVER_FROM_SLOT_FIELD = protobuf.FieldDescriptor();
_M.NTF_BATTLE_FRAME_DATA_SERVER_TO_SLOT_FIELD = protobuf.FieldDescriptor();
_M.NTF_BATTLE_FRAME_DATA_SERVER_CURR_FRAME_FIELD = protobuf.FieldDescriptor();
_M.NTF_BATTLE_FRAME_DATA_IS_CHECK_FRAME_FIELD = protobuf.FieldDescriptor();

_M.ONE_CMD_CMD_ID_FIELD.name = "cmd_id"
_M.ONE_CMD_CMD_ID_FIELD.full_name = ".battle.one_cmd.cmd_id"
_M.ONE_CMD_CMD_ID_FIELD.number = 1
_M.ONE_CMD_CMD_ID_FIELD.index = 0
_M.ONE_CMD_CMD_ID_FIELD.label = 1
_M.ONE_CMD_CMD_ID_FIELD.has_default_value = true
_M.ONE_CMD_CMD_ID_FIELD.default_value = 0
_M.ONE_CMD_CMD_ID_FIELD.type = 5
_M.ONE_CMD_CMD_ID_FIELD.cpp_type = 1

_M.ONE_CMD_UID_FIELD.name = "UID"
_M.ONE_CMD_UID_FIELD.full_name = ".battle.one_cmd.UID"
_M.ONE_CMD_UID_FIELD.number = 2
_M.ONE_CMD_UID_FIELD.index = 1
_M.ONE_CMD_UID_FIELD.label = 1
_M.ONE_CMD_UID_FIELD.has_default_value = true
_M.ONE_CMD_UID_FIELD.default_value = 0
_M.ONE_CMD_UID_FIELD.type = 13
_M.ONE_CMD_UID_FIELD.cpp_type = 3

_M.ONE_CMD_CMD_DATA_FIELD.name = "cmd_data"
_M.ONE_CMD_CMD_DATA_FIELD.full_name = ".battle.one_cmd.cmd_data"
_M.ONE_CMD_CMD_DATA_FIELD.number = 3
_M.ONE_CMD_CMD_DATA_FIELD.index = 2
_M.ONE_CMD_CMD_DATA_FIELD.label = 1
_M.ONE_CMD_CMD_DATA_FIELD.has_default_value = true
_M.ONE_CMD_CMD_DATA_FIELD.default_value = ""
_M.ONE_CMD_CMD_DATA_FIELD.type = 12
_M.ONE_CMD_CMD_DATA_FIELD.cpp_type = 9

_M.ONE_CMD.name = "one_cmd"
_M.ONE_CMD.full_name = ".battle.one_cmd"
_M.ONE_CMD.nested_types = {}
_M.ONE_CMD.enum_types = {}
_M.ONE_CMD.fields = {_M.ONE_CMD_CMD_ID_FIELD, _M.ONE_CMD_UID_FIELD, _M.ONE_CMD_CMD_DATA_FIELD}
_M.ONE_CMD.is_extendable = false
_M.ONE_CMD.extensions = {}
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_SERVER_FRAME_FIELD.name = "server_frame"
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_SERVER_FRAME_FIELD.full_name = ".battle.ntf_battle_frame_data.cmd_with_frame.server_frame"
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_SERVER_FRAME_FIELD.number = 1
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_SERVER_FRAME_FIELD.index = 0
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_SERVER_FRAME_FIELD.label = 1
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_SERVER_FRAME_FIELD.has_default_value = true
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_SERVER_FRAME_FIELD.default_value = 0
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_SERVER_FRAME_FIELD.type = 5
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_SERVER_FRAME_FIELD.cpp_type = 1

_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_CMD_FIELD.name = "cmd"
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_CMD_FIELD.full_name = ".battle.ntf_battle_frame_data.cmd_with_frame.cmd"
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_CMD_FIELD.number = 2
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_CMD_FIELD.index = 1
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_CMD_FIELD.label = 1
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_CMD_FIELD.has_default_value = false
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_CMD_FIELD.default_value = nil
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_CMD_FIELD.message_type = _M.ONE_CMD
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_CMD_FIELD.type = 11
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_CMD_FIELD.cpp_type = 10

_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME.name = "cmd_with_frame"
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME.full_name = ".battle.ntf_battle_frame_data.cmd_with_frame"
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME.nested_types = {}
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME.enum_types = {}
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME.fields = {_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_SERVER_FRAME_FIELD, _M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME_CMD_FIELD}
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME.is_extendable = false
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME.extensions = {}
_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME.containing_type = NTF_BATTLE_FRAME_DATA
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_SLOT_FIELD.name = "slot"
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_SLOT_FIELD.full_name = ".battle.ntf_battle_frame_data.one_slot.slot"
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_SLOT_FIELD.number = 1
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_SLOT_FIELD.index = 0
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_SLOT_FIELD.label = 1
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_SLOT_FIELD.has_default_value = true
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_SLOT_FIELD.default_value = 0
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_SLOT_FIELD.type = 5
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_SLOT_FIELD.cpp_type = 1

_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_CMD_LIST_FIELD.name = "cmd_list"
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_CMD_LIST_FIELD.full_name = ".battle.ntf_battle_frame_data.one_slot.cmd_list"
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_CMD_LIST_FIELD.number = 3
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_CMD_LIST_FIELD.index = 1
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_CMD_LIST_FIELD.label = 3
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_CMD_LIST_FIELD.has_default_value = false
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_CMD_LIST_FIELD.default_value = {}
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_CMD_LIST_FIELD.message_type = _M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_CMD_LIST_FIELD.type = 11
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_CMD_LIST_FIELD.cpp_type = 10

_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT.name = "one_slot"
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT.full_name = ".battle.ntf_battle_frame_data.one_slot"
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT.nested_types = {}
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT.enum_types = {}
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT.fields = {_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_SLOT_FIELD, _M.NTF_BATTLE_FRAME_DATA_ONE_SLOT_CMD_LIST_FIELD}
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT.is_extendable = false
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT.extensions = {}
_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT.containing_type = NTF_BATTLE_FRAME_DATA
_M.NTF_BATTLE_FRAME_DATA_TIME_FIELD.name = "time"
_M.NTF_BATTLE_FRAME_DATA_TIME_FIELD.full_name = ".battle.ntf_battle_frame_data.time"
_M.NTF_BATTLE_FRAME_DATA_TIME_FIELD.number = 1
_M.NTF_BATTLE_FRAME_DATA_TIME_FIELD.index = 0
_M.NTF_BATTLE_FRAME_DATA_TIME_FIELD.label = 1
_M.NTF_BATTLE_FRAME_DATA_TIME_FIELD.has_default_value = true
_M.NTF_BATTLE_FRAME_DATA_TIME_FIELD.default_value = 0
_M.NTF_BATTLE_FRAME_DATA_TIME_FIELD.type = 5
_M.NTF_BATTLE_FRAME_DATA_TIME_FIELD.cpp_type = 1

_M.NTF_BATTLE_FRAME_DATA_SLOT_LIST_FIELD.name = "slot_list"
_M.NTF_BATTLE_FRAME_DATA_SLOT_LIST_FIELD.full_name = ".battle.ntf_battle_frame_data.slot_list"
_M.NTF_BATTLE_FRAME_DATA_SLOT_LIST_FIELD.number = 3
_M.NTF_BATTLE_FRAME_DATA_SLOT_LIST_FIELD.index = 1
_M.NTF_BATTLE_FRAME_DATA_SLOT_LIST_FIELD.label = 3
_M.NTF_BATTLE_FRAME_DATA_SLOT_LIST_FIELD.has_default_value = false
_M.NTF_BATTLE_FRAME_DATA_SLOT_LIST_FIELD.default_value = {}
_M.NTF_BATTLE_FRAME_DATA_SLOT_LIST_FIELD.message_type = _M.NTF_BATTLE_FRAME_DATA_ONE_SLOT
_M.NTF_BATTLE_FRAME_DATA_SLOT_LIST_FIELD.type = 11
_M.NTF_BATTLE_FRAME_DATA_SLOT_LIST_FIELD.cpp_type = 10

_M.NTF_BATTLE_FRAME_DATA_SERVER_FROM_SLOT_FIELD.name = "server_from_slot"
_M.NTF_BATTLE_FRAME_DATA_SERVER_FROM_SLOT_FIELD.full_name = ".battle.ntf_battle_frame_data.server_from_slot"
_M.NTF_BATTLE_FRAME_DATA_SERVER_FROM_SLOT_FIELD.number = 5
_M.NTF_BATTLE_FRAME_DATA_SERVER_FROM_SLOT_FIELD.index = 2
_M.NTF_BATTLE_FRAME_DATA_SERVER_FROM_SLOT_FIELD.label = 1
_M.NTF_BATTLE_FRAME_DATA_SERVER_FROM_SLOT_FIELD.has_default_value = true
_M.NTF_BATTLE_FRAME_DATA_SERVER_FROM_SLOT_FIELD.default_value = 0
_M.NTF_BATTLE_FRAME_DATA_SERVER_FROM_SLOT_FIELD.type = 5
_M.NTF_BATTLE_FRAME_DATA_SERVER_FROM_SLOT_FIELD.cpp_type = 1

_M.NTF_BATTLE_FRAME_DATA_SERVER_TO_SLOT_FIELD.name = "server_to_slot"
_M.NTF_BATTLE_FRAME_DATA_SERVER_TO_SLOT_FIELD.full_name = ".battle.ntf_battle_frame_data.server_to_slot"
_M.NTF_BATTLE_FRAME_DATA_SERVER_TO_SLOT_FIELD.number = 6
_M.NTF_BATTLE_FRAME_DATA_SERVER_TO_SLOT_FIELD.index = 3
_M.NTF_BATTLE_FRAME_DATA_SERVER_TO_SLOT_FIELD.label = 1
_M.NTF_BATTLE_FRAME_DATA_SERVER_TO_SLOT_FIELD.has_default_value = true
_M.NTF_BATTLE_FRAME_DATA_SERVER_TO_SLOT_FIELD.default_value = 0
_M.NTF_BATTLE_FRAME_DATA_SERVER_TO_SLOT_FIELD.type = 5
_M.NTF_BATTLE_FRAME_DATA_SERVER_TO_SLOT_FIELD.cpp_type = 1

_M.NTF_BATTLE_FRAME_DATA_SERVER_CURR_FRAME_FIELD.name = "server_curr_frame"
_M.NTF_BATTLE_FRAME_DATA_SERVER_CURR_FRAME_FIELD.full_name = ".battle.ntf_battle_frame_data.server_curr_frame"
_M.NTF_BATTLE_FRAME_DATA_SERVER_CURR_FRAME_FIELD.number = 7
_M.NTF_BATTLE_FRAME_DATA_SERVER_CURR_FRAME_FIELD.index = 4
_M.NTF_BATTLE_FRAME_DATA_SERVER_CURR_FRAME_FIELD.label = 1
_M.NTF_BATTLE_FRAME_DATA_SERVER_CURR_FRAME_FIELD.has_default_value = true
_M.NTF_BATTLE_FRAME_DATA_SERVER_CURR_FRAME_FIELD.default_value = 0
_M.NTF_BATTLE_FRAME_DATA_SERVER_CURR_FRAME_FIELD.type = 5
_M.NTF_BATTLE_FRAME_DATA_SERVER_CURR_FRAME_FIELD.cpp_type = 1

_M.NTF_BATTLE_FRAME_DATA_IS_CHECK_FRAME_FIELD.name = "is_check_frame"
_M.NTF_BATTLE_FRAME_DATA_IS_CHECK_FRAME_FIELD.full_name = ".battle.ntf_battle_frame_data.is_check_frame"
_M.NTF_BATTLE_FRAME_DATA_IS_CHECK_FRAME_FIELD.number = 8
_M.NTF_BATTLE_FRAME_DATA_IS_CHECK_FRAME_FIELD.index = 5
_M.NTF_BATTLE_FRAME_DATA_IS_CHECK_FRAME_FIELD.label = 1
_M.NTF_BATTLE_FRAME_DATA_IS_CHECK_FRAME_FIELD.has_default_value = true
_M.NTF_BATTLE_FRAME_DATA_IS_CHECK_FRAME_FIELD.default_value = 0
_M.NTF_BATTLE_FRAME_DATA_IS_CHECK_FRAME_FIELD.type = 5
_M.NTF_BATTLE_FRAME_DATA_IS_CHECK_FRAME_FIELD.cpp_type = 1

_M.NTF_BATTLE_FRAME_DATA.name = "ntf_battle_frame_data"
_M.NTF_BATTLE_FRAME_DATA.full_name = ".battle.ntf_battle_frame_data"
_M.NTF_BATTLE_FRAME_DATA.nested_types = {_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME, _M.NTF_BATTLE_FRAME_DATA_ONE_SLOT}
_M.NTF_BATTLE_FRAME_DATA.enum_types = {}
_M.NTF_BATTLE_FRAME_DATA.fields = {_M.NTF_BATTLE_FRAME_DATA_TIME_FIELD, _M.NTF_BATTLE_FRAME_DATA_SLOT_LIST_FIELD, _M.NTF_BATTLE_FRAME_DATA_SERVER_FROM_SLOT_FIELD, _M.NTF_BATTLE_FRAME_DATA_SERVER_TO_SLOT_FIELD, _M.NTF_BATTLE_FRAME_DATA_SERVER_CURR_FRAME_FIELD, _M.NTF_BATTLE_FRAME_DATA_IS_CHECK_FRAME_FIELD}
_M.NTF_BATTLE_FRAME_DATA.is_extendable = false
_M.NTF_BATTLE_FRAME_DATA.extensions = {}

_M.ntf_battle_frame_data = protobuf.Message(_M.NTF_BATTLE_FRAME_DATA)
_M.ntf_battle_frame_data.cmd_with_frame = protobuf.Message(_M.NTF_BATTLE_FRAME_DATA_CMD_WITH_FRAME)
_M.ntf_battle_frame_data.one_slot = protobuf.Message(_M.NTF_BATTLE_FRAME_DATA_ONE_SLOT)
_M.one_cmd = protobuf.Message(_M.ONE_CMD)

return _M