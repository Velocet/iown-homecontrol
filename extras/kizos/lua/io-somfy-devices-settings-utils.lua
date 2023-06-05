return {
	commands_4504699139129346 = {
		dead_man_down = ({
			command_calibrate_bus_cells_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA123",
								{
									1
								}
							}
						}
					}
				}
			},
			command_calibrate_bus_cells_4516793767377410 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA132",
								{
									1
								}
							}
						}
					}
				}
			},
			command_dead_man_down_4504699139129346 = {
				{
					commands = {
						{
							baseCommand = "deadMan",
							params = {
								1,
								"APIParam:duration"
							}
						}
					}
				}
			},
			command_dead_man_impulse_down_4504699139129346 = {
				{
					commands = {
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0x01",
									"0x01",
									"0x03",
									"0x01",
									"0x00"
								}
							}
						},
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0x01",
									"0x02",
									"0x03",
									"0xFF",
									"0x00"
								}
							}
						}
					}
				}
			},
			command_dead_man_impulse_down_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0x01",
									"0x01",
									"0x06",
									"0x01",
									"0x00"
								}
							}
						}
					}
				}
			},
			command_dead_man_impulse_down_4504699139391490 = {
				{
					commands = {
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0x01",
									"0x01",
									"0x03",
									"0x00",
									"0x00"
								}
							}
						},
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0x01",
									"0x02",
									"0x03",
									"0xFF",
									"0x00"
								}
							}
						}
					}
				}
			},
			command_dead_man_impulse_down_4521191813545986 = {
				{
					commands = {
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0x01",
									"0x01",
									"0x00",
									"0x00",
									"0x00"
								}
							}
						}
					}
				}
			},
			command_dead_man_impulse_up_4504699139129346 = {
				{
					commands = {
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0x00",
									"0x01",
									"0x03",
									"0x01",
									"0x00"
								}
							}
						},
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0x00",
									"0x02",
									"0x03",
									"0xFF",
									"0x00"
								}
							}
						}
					}
				}
			},
			command_dead_man_impulse_up_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0x00",
									"0x01",
									"0x06",
									"0x01",
									"0x00"
								}
							}
						}
					}
				}
			},
			command_dead_man_impulse_up_4504699139391490 = {
				{
					commands = {
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0x00",
									"0x01",
									"0x03",
									"0x00",
									"0x00"
								}
							}
						},
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0x00",
									"0x02",
									"0x03",
									"0xFF",
									"0x00"
								}
							}
						}
					}
				}
			},
			command_dead_man_impulse_up_4521191813545986 = {
				{
					commands = {
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0x00",
									"0x01",
									"0x00",
									"0x00",
									"0x00"
								}
							}
						}
					}
				}
			},
			command_dead_man_stop_4504699139129346 = {
				{
					commands = {
						{
							baseCommand = "deadMan",
							params = {
								2,
								250
							}
						}
					}
				}
			},
			command_dead_man_up_4504699139129346 = {
				{
					commands = {
						{
							baseCommand = "deadMan",
							params = {
								0,
								"APIParam:duration"
							}
						}
					}
				}
			},
			command_delete_my_position_4504699139129346 = {
				{
					commands = {
						{
							baseCommand = "writeAlias",
							params = {
								{
									"0x01",
									"0x47",
									"0xD8",
									"0x00",
									"0xD1",
									"0x00",
									"0x00",
									"0x00"
								}
							}
						}
					}
				}
			},
			command_double_power_cut_4504699139129346 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x0C"
								}
							}
						}
					}
				}
			},
			command_eject_from_setting_mode_4504699139129346 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x0D"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state"
						}
					}
				}
			},
			command_eject_from_setting_mode_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0xDF",
									"0x0D"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"autolearning_state"
						}
					}
				}
			},
			command_eject_from_setting_mode_4504699139391490 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x0D"
								}
							}
						}
					}
				}
			},
			command_enter_auxiliary_parameter_settings_mode_4504699139129602 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x23"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"evb_tilting_travel"
						}
					}
				}
			},
			command_enter_auxiliary_parameter_settings_mode_4531087419179010 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x23"
								}
							}
						}
					}
				}
			},
			command_enter_back_impulse_setting_mode_4506898163302402 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x0B"
								}
							}
						}
					}
				}
			},
			command_enter_settings_mode_4504699139129346 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x16"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state"
						}
					}
				}
			},
			command_enter_settings_mode_4504699139194882 = {
				{
					context = {
						["state:setting_state"] = {
							"Not set"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x16"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state"
						}
					}
				},
				{
					context = {
						["state:setting_state"] = {
							"Set",
							"User mode"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x04",
									"0x00",
									"0x05",
									"0x14",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state"
						}
					}
				}
			},
			command_enter_settings_mode_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0xDF",
									"0x16"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"autolearning_state"
						}
					}
				}
			},
			command_enter_settings_mode_4504699139391490 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x16"
								}
							}
						}
					}
				}
			},
			command_enter_settings_mode_4506898162384898 = {
				{
					context = {
						["state:setting_state"] = {
							"Not set",
							"Setting in progress"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x16"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state"
						}
					}
				},
				{
					context = {
						["state:setting_state"] = {
							"Set",
							"User mode"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x04",
									"0x00",
									"0x05",
									"0x14",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state"
						}
					}
				}
			},
			command_enter_settings_mode_4506898162385154 = {
				{
					context = {
						["state:setting_state"] = {
							"Not set"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x04",
									"0x00",
									"0x05",
									"0x00",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state"
						}
					}
				},
				{
					context = {
						["state:setting_state"] = {
							"Set",
							"User mode"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x04",
									"0x00",
									"0x05",
									"0x14",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state"
						}
					}
				}
			},
			command_enter_settings_mode_4510196697268226 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x04",
									"0x00",
									"0x05",
									"0x00",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state"
						}
					}
				}
			},
			command_invert_rotation_4504699139129346 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x15"
								}
							}
						}
					}
				}
			},
			command_invert_rotation_4504699139129602 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x02",
									"0x00",
									"0x05",
									"0x08",
									"0x00"
								}
							}
						}
					}
				}
			},
			command_invert_rotation_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writePrivateWithoutPolling",
							params = {
								{
									"0x02",
									"0xDF",
									"0x15"
								}
							}
						}
					}
				}
			},
			command_read_end_limits_states_4504699140768002 = {
				{
					commands = {
						{
							baseCommand = "readMP"
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"rel_current_mode",
							"uel_current_mode",
							"setting_state"
						}
					}
				}
			},
			command_read_photocells_input_status_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "readObjectPublic",
							params = {
								"0x8101",
								"0x00"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"photocells_input_status"
						}
					}
				}
			},
			command_refresh_all_access_settings_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "readObjectPublic",
							params = {
								"0x8101",
								"0x00"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"detailed_actuator_type",
							"cells_activation",
							"autolearning_state",
							"mode_user_total",
							"close_tempo_total_mode",
							"cruising_speed_type_opening",
							"docking_area_type_in_closing",
							"cruising_speed_type_closing",
							"docking_area_type_in_opening",
							"docking_area_speed_closing",
							"resistance_sensitivity",
							"settings_lock_status"
						}
					}
				}
			},
			command_refresh_all_access_settings_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "readObjectPublic",
							params = {
								"0x8101",
								"0x00"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"cells_activation",
							"autolearning_state",
							"mode_user_total",
							"close_tempo_total_mode",
							"mode_user_partial",
							"close_short_tempo_partial_mode",
							"close_long_tempo_partial_mode",
							"programmable_safety_input",
							"programmable_safety_input_function",
							"programmable_safety_input_action",
							"wired_control",
							"orange_light_prelighting",
							"area_lighting_activation",
							"area_lighting_tempo",
							"auxiliary_control_activation",
							"auxiliary_control_tempo",
							"lock_output",
							"cruising_speed_type_opening",
							"docking_area_type_in_closing",
							"cruising_speed_type_closing",
							"docking_area_type_in_opening",
							"docking_area_speed_opening",
							"docking_area_speed_closing",
							"motor_shift_in_closing",
							"motor_shift_in_opening",
							"lock_release",
							"motor1_closing_torque_limitation",
							"motor1_opening_torque_limitation",
							"motor1_closing_slowdown_torque_limitation",
							"motor1_opening_slowdown_torque_limitation",
							"motor2_closing_torque_limitation",
							"motor2_opening_torque_limitation",
							"motor2_closing_slowdown_torque_limitation",
							"motor2_opening_slowdown_torque_limitation",
							"settings_lock_status"
						}
					}
				}
			},
			command_refresh_all_access_settings_4512395720866306 = {
				{
					commands = {
						{
							baseCommand = "readObjectPublic",
							params = {
								"0x8101",
								"0x00"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"cells_activation",
							"autolearning_state",
							"mode_user_total",
							"close_tempo_total_mode",
							"mode_user_partial",
							"close_short_tempo_partial_mode",
							"close_long_tempo_partial_mode",
							"pop_value",
							"safety_edge_activation",
							"programmable_safety_input",
							"programmable_safety_input_function",
							"programmable_safety_input_action",
							"wired_control",
							"orange_light_prelighting",
							"area_lighting_activation",
							"area_lighting_tempo",
							"auxiliary_control_activation",
							"auxiliary_control_tempo",
							"cruising_speed_type_opening",
							"docking_area_type_in_closing",
							"cruising_speed_type_closing",
							"docking_area_type_in_opening",
							"docking_area_speed_opening",
							"docking_area_speed_closing",
							"motor1_closing_torque_limitation",
							"motor1_opening_torque_limitation",
							"motor1_closing_slowdown_torque_limitation",
							"motor1_opening_slowdown_torque_limitation",
							"resistance_sensitivity",
							"settings_lock_status"
						}
					}
				}
			},
			command_refresh_all_access_settings_4516793767377410 = {
				{
					commands = {
						{
							baseCommand = "readObjectPublic",
							params = {
								"0x8101",
								"0x00"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"cells_activation",
							"autolearning_state",
							"mode_user_total",
							"close_tempo_total_mode",
							"safety_edge_activation",
							"cruising_speed_type_opening",
							"docking_area_type_in_closing",
							"cruising_speed_type_closing",
							"docking_area_type_in_opening",
							"docking_area_speed_closing",
							"resistance_sensitivity",
							"settings_lock_status"
						}
					}
				}
			},
			command_refresh_all_access_settings_4517893278874114 = {
				{
					commands = {
						{
							baseCommand = "readObjectPublic",
							params = {
								"0x8101",
								"0x00"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"cells_activation",
							"autolearning_state",
							"mode_user_total",
							"close_tempo_total_mode",
							"safety_edge_technology",
							"auxiliary_control_activation",
							"settings_lock_status"
						}
					}
				}
			},
			command_refresh_all_access_settings_4527788883655170 = {
				{
					commands = {
						{
							baseCommand = "readObjectPublic",
							params = {
								"0x8101",
								"0x00"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"cells_activation",
							"autolearning_state",
							"mode_user_total",
							"close_tempo_total_mode",
							"mode_user_partial",
							"close_short_tempo_partial_mode",
							"close_long_tempo_partial_mode",
							"programmable_safety_input",
							"programmable_safety_input_function",
							"programmable_safety_input_action",
							"wired_control",
							"orange_light_prelighting",
							"area_lighting_activation",
							"area_lighting_tempo",
							"auxiliary_control_activation",
							"auxiliary_control_tempo",
							"lock_output",
							"cruising_speed_type_opening",
							"docking_area_type_in_closing",
							"cruising_speed_type_closing",
							"docking_area_type_in_opening",
							"docking_area_speed_opening",
							"docking_area_speed_closing",
							"motor_shift_in_closing",
							"motor_shift_in_opening",
							"lock_release",
							"additional_thrust_in_closing",
							"motor1_closing_torque_limitation",
							"motor1_opening_torque_limitation",
							"motor1_closing_slowdown_torque_limitation",
							"motor1_opening_slowdown_torque_limitation",
							"motor2_closing_torque_limitation",
							"motor2_opening_torque_limitation",
							"motor2_closing_slowdown_torque_limitation",
							"motor2_opening_slowdown_torque_limitation",
							"settings_lock_status"
						}
					}
				}
			},
			command_reset_actuator_4504699139129346 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xEE",
									"0x00"
								}
							}
						}
					}
				}
			},
			command_reset_actuator_param_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA504",
								{
									3
								}
							}
						}
					}
				}
			},
			command_reset_actuator_settings_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA504",
								{
									2
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state"
						}
					}
				}
			},
			command_reset_end_limits_4504699140768002 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x29"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"rel_current_mode",
							"uel_current_mode",
							"setting_state"
						}
					}
				}
			},
			command_reset_io_1W_and_key_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA504",
								{
									4
								}
							}
						}
					}
				}
			},
			command_save_auxiliary_end_limit_entry_4504699139194882 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x24"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"unroll_end_limit_state"
						}
					}
				}
			},
			command_save_auxiliary_end_limit_exit_4504699139194882 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x25"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"unroll_end_limit_state"
						}
					}
				}
			},
			command_save_back_impulse_position_4506898163302402 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x0A"
								}
							}
						}
					}
				}
			},
			command_save_evb_tilting_travel_4504699140112386 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x10"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"evb_tilting_travel"
						}
					}
				}
			},
			command_save_evb_tilting_travel_4531087419179010 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x02"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"evb_tilting_travel_pulse"
						}
					}
				}
			},
			command_save_flat_slats_position_4504699139129602 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x12"
								}
							}
						}
					}
				}
			},
			command_save_lower_end_limit_4504699139129346 = {
				{
					context = {
						["state:setting_state"] = {
							"Not set"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x05",
									"0x00",
									"0x05",
									"0x00",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				},
				{
					context = {
						["state:setting_state"] = {
							"Set",
							"User mode"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x13"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_save_lower_end_limit_4504699139194882 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x13"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_save_lower_end_limit_4504699139391490 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x13"
								}
							}
						}
					}
				}
			},
			command_save_lower_end_limit_4506898162384898 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x05",
									"0x00",
									"0x05",
									"0x00",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_save_my_position_4504699139129346 = {
				{
					commands = {
						{
							baseCommand = "writeAlias",
							params = {
								{
									"0x01",
									"0x47",
									"0xD8",
									"0x00",
									"0xFF",
									"0xFF",
									"0x00",
									"0x00"
								}
							},
							conversions = {
								{
									index = 0,
									function = "writeInt",
									params = {
										4,
										2,
										"state:current_position"
									}
								}
							}
						}
					}
				}
			},
			command_save_partial_position_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA132",
								{
									5
								}
							}
						}
					}
				}
			},
			command_save_partial_position_4516793767377410 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA132",
								{
									6
								}
							}
						}
					}
				}
			},
			command_save_settings_4504699139129346 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x0E"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state",
							"roll_end_limit_state",
							"unroll_end_limit_state"
						}
					}
				}
			},
			command_save_settings_4510196698185730 = {
				{
					context = {
						["state:setting_state"] = {
							"Not set"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x0E"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state",
							"roll_end_limit_state",
							"unroll_end_limit_state"
						}
					}
				},
				{
					context = {
						["state:setting_state"] = {
							"Set",
							"User mode"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x02",
									"0x00",
									"0x05",
									"0x08",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state",
							"roll_end_limit_state",
							"unroll_end_limit_state"
						}
					}
				}
			},
			command_save_settings_4512395720523778 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x02",
									"0x00",
									"0x05",
									"0x08",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state",
							"roll_end_limit_state",
							"unroll_end_limit_state"
						}
					}
				}
			},
			command_save_settings_4521191813545986 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x0E"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"setting_state"
						}
					}
				}
			},
			command_save_upper_end_limit_4504699139129346 = {
				{
					context = {
						["state:setting_state"] = {
							"Not set"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x06",
									"0x00",
									"0x05",
									"0x00",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"setting_state"
						}
					}
				},
				{
					context = {
						["state:setting_state"] = {
							"Set",
							"User mode"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x14"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_save_upper_end_limit_4504699139194882 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x14"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_save_upper_end_limit_4504699139391490 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x14"
								}
							}
						}
					}
				}
			},
			command_save_upper_end_limit_4506898162384898 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x06",
									"0x00",
									"0x05",
									"0x00",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_set_OEM_Battery_Name_4584963487956994 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObjectString",
							params = {
								"0xA615",
								140,
								"APIParam:OEM_Battery_Name",
								false,
								40
							}
						}
					}
				}
			},
			command_set_OEM_Battery_Reference_4584963487956994 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObjectString",
							params = {
								"0xA615",
								139,
								"APIParam:OEM_Battery_Reference",
								false,
								16
							}
						}
					}
				}
			},
			command_set_OEM_SolarPanel_Name_4584963487956994 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObjectString",
							params = {
								"0xA615",
								142,
								"APIParam:OEM_SolarPanel_Name",
								false,
								40
							}
						}
					}
				}
			},
			command_set_OEM_SolarPanel_Reference_4584963487956994 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObjectString",
							params = {
								"0xA615",
								141,
								"APIParam:OEM_SolarPanel_Reference",
								false,
								16
							}
						}
					}
				}
			},
			command_set_additional_thrust_in_closing_4527788883655170 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA124",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:additional_thrust_in_closing"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													short = 0,
													long = 1
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"additional_thrust_in_closing"
						}
					}
				}
			},
			command_set_application_4504699140768002 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								26,
								2,
								"APIParam:application"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											two_panels_pull_left_to_open = 59,
											two_panels_pull_right_to_open = 60
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"application"
						}
					}
				}
			},
			command_set_application_4507997674930178 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								26,
								2,
								"APIParam:application"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											lateral_arm_awning = 58,
											external_vertical_screen = 9,
											pergola_vertical_screen = 10,
											valance = 44
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"application"
						}
					}
				}
			},
			command_set_area_lighting_activation_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA11D",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:area_lighting_activation"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													controlled = 1,
													auto = 0,
													["auto_+_controlled"] = 2
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"area_lighting_activation"
						}
					}
				}
			},
			command_set_area_lighting_tempo_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA11E",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:area_lighting_tempo"
									},
									conversions = {
										{
											index = 2,
											function = "operation",
											params = {
												"/",
												10
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"area_lighting_tempo"
						}
					}
				}
			},
			command_set_auto_end_limits_4504699139194882 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x04",
									"0x00",
									"0x05",
									"0x00",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_set_auto_end_limits_4521191813545986 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x16"
								}
							}
						},
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x18",
									"0x02"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_set_auto_lower_end_limit_4521191813545986 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x16"
								}
							}
						},
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x18",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_set_auto_upper_end_limit_4521191813545986 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x16"
								}
							}
						},
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x18",
									"0x01"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_set_auxiliary_control_activation_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA11F",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:auxiliary_control_activation"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													drived_bistable_tempo = 6,
													auto_mode_open_gate_light = 1,
													drived_impulse = 5,
													inactive = 0,
													drived_bistable = 4,
													auto_mode_impulse = 3,
													auto_mode_bistable_tempo = 2
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"auxiliary_control_activation"
						}
					}
				}
			},
			command_set_auxiliary_control_activation_4517893278874114 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA11F",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:auxiliary_control_activation"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													orange_light = 10,
													area_lighting = 8
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"auxiliary_control_activation"
						}
					}
				}
			},
			command_set_auxiliary_control_tempo_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA120",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:auxiliary_control_tempo"
									},
									conversions = {
										{
											index = 2,
											function = "operation",
											params = {
												"/",
												10
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"auxiliary_control_tempo"
						}
					}
				}
			},
			command_set_cells_activation_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA117",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:cells_activation"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													active_autotest_output = 2,
													bus_cells = 4,
													inactive = 0,
													active_autotest_powered = 3,
													active = 1
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"cells_activation"
						}
					}
				}
			},
			command_set_choregraphy_disable_variator_down_move_min_4531087419179010 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA60B",
								137,
								2,
								"APIParam:choregraphy_disable_variator_down_move_min"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"choregraphy_disable_variator_down_move_min"
						}
					}
				}
			},
			command_set_choregraphy_disable_variator_up_move_min_4531087419179010 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA60B",
								138,
								2,
								"APIParam:choregraphy_disable_variator_up_move_min"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"choregraphy_disable_variator_up_move_min"
						}
					}
				}
			},
			command_set_choregraphy_enable_variator_down_move_min_4531087419179010 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA60B",
								139,
								2,
								"APIParam:choregraphy_enable_variator_down_move_min"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"choregraphy_enable_variator_down_move_min"
						}
					}
				}
			},
			command_set_choregraphy_enable_variator_up_move_min_4531087419179010 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA60B",
								140,
								2,
								"APIParam:choregraphy_enable_variator_up_move_min"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"choregraphy_enable_variator_up_move_min"
						}
					}
				}
			},
			command_set_close_long_tempo_partial_mode_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA104",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:close_long_tempo_partial_mode"
									},
									conversions = {
										{
											index = 2,
											function = "operation",
											params = {
												"/",
												5
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"close_long_tempo_partial_mode"
						}
					}
				}
			},
			command_set_close_short_tempo_partial_mode_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA103",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:close_short_tempo_partial_mode"
									},
									conversions = {
										{
											index = 2,
											function = "operation",
											params = {
												"/",
												10
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"close_short_tempo_partial_mode"
						}
					}
				}
			},
			command_set_close_tempo_total_mode_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA134",
								{
									255,
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										2,
										"APIParam:close_tempo"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"close_tempo_total_mode"
						}
					}
				}
			},
			command_set_close_tempo_total_mode_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA101",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:close_tempo"
									},
									conversions = {
										{
											index = 2,
											function = "operation",
											params = {
												"/",
												10
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"close_tempo_total_mode"
						}
					}
				}
			},
			command_set_close_tempo_total_mode_4517893278874114 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA134",
								{
									255,
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										2,
										"APIParam:close_tempo_total_mode"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"close_tempo_total_mode"
						}
					}
				}
			},
			command_set_cruising_speed_type_closing_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA106",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:cruising_speed_type_closing"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													medium = 102,
													slow = 101,
													fast = 103
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"cruising_speed_type_closing"
						}
					}
				}
			},
			command_set_cruising_speed_type_closing_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA106",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:cruising_speed_type_closing"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"cruising_speed_type_closing"
						}
					}
				}
			},
			command_set_cruising_speed_type_opening_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA107",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:cruising_speed_type_opening"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													medium = 102,
													slow = 101,
													fast = 103
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"cruising_speed_type_opening"
						}
					}
				}
			},
			command_set_cruising_speed_type_opening_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA107",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:cruising_speed_type_opening"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"cruising_speed_type_opening"
						}
					}
				}
			},
			command_set_curtain_outstretching_level_4504699139194882 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA60A",
								128,
								1,
								"APIParam:curtain_outstretching_level"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											high = 2,
											medium = 1,
											low = 0
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"curtain_outstretching_level"
						}
					}
				}
			},
			command_set_dbe_down_4513495232217090 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x07",
									"0xFF"
								}
							},
							conversions = {
								{
									index = 0,
									function = "writeInt",
									params = {
										3,
										1,
										"APIParam:dbe_down"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													high = 2,
													medium = 1,
													low = 0
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"dbe_down"
						}
					}
				}
			},
			command_set_dbe_up_4504699140047106 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x07",
									"0xFF"
								}
							},
							conversions = {
								{
									index = 0,
									function = "writeInt",
									params = {
										3,
										1,
										"APIParam:dbe_up"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													high = 2,
													medium = 1,
													low = 0
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"dbe_up"
						}
					}
				}
			},
			command_set_detailed_actuator_type_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA232",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:detailed_actuator_type"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													gdo_sectional = 2,
													gdo_horizontal = 4,
													gdo_vertical = 3
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"detailed_actuator_type"
						}
					}
				}
			},
			command_set_discreet_mode_speed_4521191813545986 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA617",
								128,
								1,
								"APIParam:discreet_mode_speed"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"discreet_mode_speed"
						}
					}
				}
			},
			command_set_docking_area_speed_closing_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA12B",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:docking_area_speed_closing"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													medium = 2,
													slow = 1,
													fast = 3
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"docking_area_speed_closing"
						}
					}
				}
			},
			command_set_docking_area_speed_closing_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA12B",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:docking_area_speed_closing"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"docking_area_speed_closing"
						}
					}
				}
			},
			command_set_docking_area_speed_opening_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA12C",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:docking_area_speed_opening"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"docking_area_speed_opening"
						}
					}
				}
			},
			command_set_docking_area_type_in_closing_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA108",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:docking_area_type_in_closing"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													mini = 100,
													short = 101,
													long = 102
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"docking_area_type_in_closing"
						}
					}
				}
			},
			command_set_docking_area_type_in_closing_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA108",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:docking_area_type_in_closing"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"docking_area_type_in_closing"
						}
					}
				}
			},
			command_set_docking_area_type_in_opening_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA109",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:docking_area_type_in_opening"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													mini = 100,
													short = 101,
													long = 102
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"docking_area_type_in_opening"
						}
					}
				}
			},
			command_set_docking_area_type_in_opening_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA109",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:docking_area_type_in_opening"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"docking_area_type_in_opening"
						}
					}
				}
			},
			command_set_eld_level_4505798652395778 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA60A",
								128,
								1,
								"APIParam:eld_level"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											very_low = 4,
											low = 0,
											high = 2,
											very_high = 3,
											nominal = 1
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"eld_level"
						}
					}
				}
			},
			command_set_evb_tilting_travel_pulse_4531087419179010 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA60B",
								142,
								2,
								"APIParam:evb_tilting_travel_pulse"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"evb_tilting_travel_pulse"
						}
					}
				}
			},
			command_set_kinematics_4531087419179010 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								6,
								1,
								"APIParam:kinematics"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											EVB_standard = 0,
											EVB_WP2 = 3,
											EVB_alternative = 1,
											EVB_WP1 = 2
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"kinematics"
						}
					}
				}
			},
			command_set_knx_4554177162379266 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								140,
								1,
								"APIParam:knx"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"knx"
						}
					}
				}
			},
			command_set_load_AC_drive_request_4504699139391490 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA608",
								4,
								1,
								"APIParam:load_AC_drive_request"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											["on off"] = 1,
											["trailing edge"] = 2,
											["leading edge"] = 3
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"load_AC_drive_request"
						}
					}
				}
			},
			command_set_lock_output_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA121",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:lock_output"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													active_pulse_12V = 1,
													active_pulse_24V = 0
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"lock_output"
						}
					}
				}
			},
			command_set_lock_release_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA122",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:lock_release"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													active = 1,
													inactive = 0
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"lock_release"
						}
					}
				}
			},
			command_set_mode_user_partial_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA102",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:mode_user_partial"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													without_auto_closure = 1,
													same_total_mode = 0,
													with_auto_closure = 2
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"mode_user_partial"
						}
					}
				}
			},
			command_set_mode_user_total_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA100",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:mode_user_total"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													auto = 3,
													deadman = 5,
													sequential_long_tempo_cells_block = 6,
													auto_cells_cells_block = 4,
													semi_auto = 2,
													sequential_short_tempo = 1,
													sequential = 0
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"mode_user_total"
						}
					}
				}
			},
			command_set_motor1_closing_slowdown_torque_limitation_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA10E",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:motor1_closing_slowdown_torque_limitation"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"motor1_closing_slowdown_torque_limitation"
						}
					}
				}
			},
			command_set_motor1_closing_torque_limitation_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA10C",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:motor1_closing_torque_limitation"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"motor1_closing_torque_limitation"
						}
					}
				}
			},
			command_set_motor1_opening_slowdown_torque_limitation_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA10F",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:motor1_opening_slowdown_torque_limitation"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"motor1_opening_slowdown_torque_limitation"
						}
					}
				}
			},
			command_set_motor1_opening_torque_limitation_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA10D",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:motor1_opening_torque_limitation"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"motor1_opening_torque_limitation"
						}
					}
				}
			},
			command_set_motor2_closing_slowdown_torque_limitation_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA112",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:motor2_closing_slowdown_torque_limitation"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"motor2_closing_slowdown_torque_limitation"
						}
					}
				}
			},
			command_set_motor2_closing_torque_limitation_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA110",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:motor2_closing_torque_limitation"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"motor2_closing_torque_limitation"
						}
					}
				}
			},
			command_set_motor2_opening_slowdown_torque_limitation_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA113",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:motor2_opening_slowdown_torque_limitation"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"motor2_opening_slowdown_torque_limitation"
						}
					}
				}
			},
			command_set_motor2_opening_torque_limitation_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA111",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:motor2_opening_torque_limitation"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"motor2_opening_torque_limitation"
						}
					}
				}
			},
			command_set_motor_shift_in_closing_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA10A",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:motor_shift_in_closing"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"motor_shift_in_closing"
						}
					}
				}
			},
			command_set_motor_shift_in_opening_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA10B",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:motor_shift_in_opening"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"motor_shift_in_opening"
						}
					}
				}
			},
			command_set_nominal_mode_speed_4521191813545986 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA617",
								129,
								1,
								"APIParam:nominal_mode_speed"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"nominal_mode_speed"
						}
					}
				}
			},
			command_set_obstacle_detection_4504699139194882 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA60A",
								130,
								1,
								"APIParam:obstacle_detection"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											no_sensitivity = 3,
											lowest_sensitivity = 2,
											highest_sensitivity = 0,
											nominal_sensitivity = 1
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"obstacle_detection"
						}
					}
				}
			},
			command_set_obstacle_detection_4531087419179010 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA60A",
								129,
								1,
								"APIParam:obstacle_detection"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											no_sensitivity = 3,
											lowest_sensitivity = 2,
											highest_sensitivity = 0,
											nominal_sensitivity = 1
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"obstacle_detection"
						}
					}
				}
			},
			command_set_open_level_4521191813545986 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								18,
								1,
								"APIParam:open_level"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											close_tcs = 0,
											medium_tcs = 1,
											far_tcs = 2
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"open_level"
						}
					}
				}
			},
			command_set_orange_light_prelighting_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA105",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:orange_light_prelighting"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													active = 1,
													inactive = 0
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"orange_light_prelighting"
						}
					}
				}
			},
			command_set_pop_value_4512395720866306 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA126",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:pop_value"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"pop_value"
						}
					}
				}
			},
			command_set_programmable_safety_input_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA119",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:programmable_safety_input"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													active_autotest_output = 2,
													active_bus_cells = 4,
													inactive = 0,
													active_autotest_powered = 3,
													active = 1
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"programmable_safety_input"
						}
					}
				}
			},
			command_set_programmable_safety_input_action_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA11B",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:programmable_safety_input_action"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													stop_release = 1,
													stop_reverse_mvt = 2,
													stop = 0
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"programmable_safety_input_action"
						}
					}
				}
			},
			command_set_programmable_safety_input_function_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA11A",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:programmable_safety_input_function"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													any_mvt_forbidden = 3,
													active_closure = 0,
													active_closure_admap = 2,
													active_opening = 1
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"programmable_safety_input_function"
						}
					}
				}
			},
			command_set_recovered_state_after_power_cut_4504699139391490 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								29,
								1,
								"APIParam:recovered_state_after_power_cut"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											["off state"] = 0,
											["last operation state"] = 1
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"recovered_state_after_power_cut"
						}
					}
				}
			},
			command_set_resistance_sensitivity_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA116",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:resistance_sensitivity"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													high = 3,
													normal = 2,
													low = 1,
													very_low = 0
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"resistance_sensitivity"
						}
					}
				}
			},
			command_set_running_time_up_4504699140243458 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA609",
								138,
								2,
								"APIParam:running_time_up"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"running_time_up"
						}
					}
				}
			},
			command_set_safety_edge_activation_4512395720866306 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA118",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:safety_edge_activation"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													active_autotest = 2,
													active = 1,
													inactive = 0
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"safety_edge_activation"
						}
					}
				}
			},
			command_set_safety_edge_activation_4516793767377410 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA118",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:safety_edge_activation"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													active = 0,
													active_autotested = 1
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"safety_edge_activation"
						}
					}
				}
			},
			command_set_safety_edge_technology_4517893278874114 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA203",
								{
									255,
									0
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:safety_edge_technology"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													wired_ese_8k2 = 2,
													wired_ese_1k2 = 3,
													wired_ose = 1
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"safety_edge_technology"
						}
					}
				}
			},
			command_set_security_level_4521191813545986 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								19,
								1,
								"APIParam:security_level"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											over_tcs = 2,
											links_not_locked = 0,
											normal = 1
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"security_level"
						}
					}
				}
			},
			command_set_settings_lock_status_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA129",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:settings_lock_status"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													locked = 1,
													unlocked = 0
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"settings_lock_status"
						}
					}
				}
			},
			command_set_smart_protect_4521191813545986 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								137,
								1,
								"APIParam:smart_protect"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											enable = 1,
											disable = 0
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"smart_protect"
						}
					}
				}
			},
			command_set_soft_start_4521191813545986 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								21,
								1,
								"APIParam:soft_start"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"soft_start"
						}
					}
				}
			},
			command_set_soft_stop_4521191813545986 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								22,
								1,
								"APIParam:soft_stop"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"soft_stop"
						}
					}
				}
			},
			command_set_tilting_time_4504699140243458 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA60B",
								132,
								2,
								"APIParam:tilting_time"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"tilting_time"
						}
					}
				}
			},
			command_set_timeout_timer_4504699139981826 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								135,
								1,
								"APIParam:timeout_timer"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											enable = 1,
											disable = 0
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"timeout_timer"
						}
					}
				}
			},
			command_set_timeout_timer_value_4504699139981826 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								136,
								2,
								"APIParam:timeout_timer_value"
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"timeout_timer_value"
						}
					}
				}
			},
			command_set_type_lock_4504699139194882 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								139,
								1,
								"APIParam:type_lock"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											auto_locks = 1,
											no_locks = 0,
											manual_locks = 2
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"type_lock"
						}
					}
				}
			},
			command_set_unstressing_status_4504699139194882 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x05",
									"0xFF",
									"0xFF",
									"0xFF"
								}
							},
							conversions = {
								{
									index = 0,
									function = "writeInt",
									params = {
										3,
										1,
										"APIParam:unstressing_status"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													enable = 1,
													disable = 0
												}
											}
										}
									}
								},
								{
									index = 0,
									function = "writeInt",
									params = {
										4,
										2,
										"state:unstressing_duration"
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"unstressing_status",
							"unstressing_duration"
						}
					}
				}
			},
			command_set_unstressing_status_4535485464772610 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA60B",
								0,
								1,
								"APIParam:unstressing_status"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											enable = 1,
											disable = 0
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"unstressing_status"
						}
					}
				}
			},
			command_set_ventilation_lock_4504699140768002 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								32,
								1,
								"APIParam:ventilation_lock"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											enable = 1,
											disable = 0
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"ventilation_lock"
						}
					}
				}
			},
			command_set_wired_control_4504699139471874 = {
				{
					commands = {
						{
							baseCommand = "writeRawObject",
							params = {
								"0xA11C",
								{
									255
								}
							},
							conversions = {
								{
									index = 1,
									function = "writeInt",
									params = {
										0,
										1,
										"APIParam:wired_control"
									},
									conversions = {
										{
											index = 2,
											function = "simpleMatching",
											params = {
												{
													total_partial_mode = 0,
													open_close_mode = 1
												}
											}
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"wired_control"
						}
					}
				}
			},
			command_set_wired_input_type_4504699139391490 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								141,
								1,
								"APIParam:wired_input_type"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											["single momentary switch"] = 0,
											["fixed switch"] = 1,
											["double momentary switch"] = 2
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"wired_input_type"
						}
					}
				}
			},
			command_set_x_time_4504699139194882 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA610",
								132,
								1,
								"APIParam:x_time"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											level_0 = 0,
											level_1 = 1,
											level_2 = 2
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"x_time"
						}
					}
				}
			},
			command_set_x_time_4507997674930178 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								138,
								1,
								"APIParam:x_time"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											level_0 = 0,
											level_1 = 1,
											level_2 = 2
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"x_time",
							"oem_x_time"
						}
					}
				}
			},
			command_set_x_time_4531087419179010 = {
				{
					commands = {
						{
							baseCommand = "writeSOFOPUObject",
							params = {
								"0xA603",
								138,
								1,
								"APIParam:x_time"
							},
							conversions = {
								{
									index = 3,
									function = "simpleMatching",
									params = {
										{
											disable = 255,
											enable = 0
										}
									}
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"x_time"
						}
					}
				}
			},
			command_start_auto_learning_4581664953073666 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x20"
								}
							}
						}
					}
				}
			},
			command_start_autolearning_4504699139340802 = {
				{
					commands = {
						{
							baseCommand = "accessLearningEndLimits"
						}
					}
				}
			},
			command_stop_after_save_limit_4504699139129346 = {
				{
					context = {
						["state:setting_state"] = {
							"Not set"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x02",
									"0x00",
									"0x05",
									"0x00",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				},
				{
					context = {
						["state:setting_state"] = {
							"Set",
							"User mode"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x0E"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_stop_after_save_limit_4504699139194882 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0x02",
									"0x00",
									"0x05",
									"0x00",
									"0x00"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_stop_after_save_limit_4504699139653634 = {
				{
					context = {
						["state:setting_state"] = {
							"Not set"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x1B"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				},
				{
					context = {
						["state:setting_state"] = {
							"Set",
							"User mode"
						}
					},
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x0E"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_stop_after_save_limit_4504699140898818 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x0E"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				}
			},
			command_stop_after_save_limit_4506898162384898 = {
				{
					commands = {
						{
							baseCommand = "writePrivate",
							params = {
								{
									"0x02",
									"0xDF",
									"0x1B"
								}
							}
						}
					},
					trigger = {
						function = "refreshState",
						params = {
							"roll_end_limit_state",
							"unroll_end_limit_state",
							"setting_state"
						}
					}
				}
			}
		})["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139129346"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139129346"]
	},
	commands_4504699139129602 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_auxiliary_parameter_settings_mode = ()["command_enter_auxiliary_parameter_settings_mode_4504699139129602"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129602"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_flat_slats_position = ()["command_save_flat_slats_position_4504699139129602"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139129346"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139129346"]
	},
	commands_4504699139194882 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139194882"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_auxiliary_end_limit_entry = ()["command_save_auxiliary_end_limit_entry_4504699139194882"],
		save_auxiliary_end_limit_exit = ()["command_save_auxiliary_end_limit_exit_4504699139194882"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_auto_end_limits = ()["command_set_auto_end_limits_4504699139194882"],
		set_curtain_outstretching_level = ()["command_set_curtain_outstretching_level_4504699139194882"],
		set_obstacle_detection = ()["command_set_obstacle_detection_4504699139194882"],
		set_type_lock = ()["command_set_type_lock_4504699139194882"],
		set_unstressing_status = ()["command_set_unstressing_status_4504699139194882"],
		set_x_time = ()["command_set_x_time_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139194882"]
	},
	commands_4504699139340802 = {
		calibrate_bus_cells = ()["command_calibrate_bus_cells_4504699139340802"],
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139340802"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139340802"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139340802"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139340802"],
		invert_rotation = ()["command_invert_rotation_4504699139340802"],
		read_photocells_input_status = ()["command_read_photocells_input_status_4504699139340802"],
		refresh_all_access_settings = ()["command_refresh_all_access_settings_4504699139340802"],
		reset_actuator_param = ()["command_reset_actuator_param_4504699139340802"],
		reset_actuator_settings = ()["command_reset_actuator_settings_4504699139340802"],
		reset_io_1W_and_key = ()["command_reset_io_1W_and_key_4504699139340802"],
		save_partial_position = ()["command_save_partial_position_4504699139340802"],
		set_cells_activation = ()["command_set_cells_activation_4504699139340802"],
		set_close_tempo_total_mode = ()["command_set_close_tempo_total_mode_4504699139340802"],
		set_cruising_speed_type_closing = ()["command_set_cruising_speed_type_closing_4504699139340802"],
		set_cruising_speed_type_opening = ()["command_set_cruising_speed_type_opening_4504699139340802"],
		set_detailed_actuator_type = ()["command_set_detailed_actuator_type_4504699139340802"],
		set_docking_area_speed_closing = ()["command_set_docking_area_speed_closing_4504699139340802"],
		set_docking_area_type_in_closing = ()["command_set_docking_area_type_in_closing_4504699139340802"],
		set_docking_area_type_in_opening = ()["command_set_docking_area_type_in_opening_4504699139340802"],
		set_mode_user_total = ()["command_set_mode_user_total_4504699139340802"],
		set_resistance_sensitivity = ()["command_set_resistance_sensitivity_4504699139340802"],
		set_settings_lock_status = ()["command_set_settings_lock_status_4504699139340802"],
		start_autolearning = ()["command_start_autolearning_4504699139340802"]
	},
	commands_4504699139391490 = {
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139391490"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139391490"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139391490"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139391490"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139391490"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139391490"],
		set_load_AC_drive_request = ()["command_set_load_AC_drive_request_4504699139391490"],
		set_recovered_state_after_power_cut = ()["command_set_recovered_state_after_power_cut_4504699139391490"],
		set_wired_input_type = ()["command_set_wired_input_type_4504699139391490"]
	},
	commands_4504699139471874 = {
		calibrate_bus_cells = ()["command_calibrate_bus_cells_4504699139340802"],
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139340802"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139340802"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139340802"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139340802"],
		invert_rotation = ()["command_invert_rotation_4504699139340802"],
		refresh_all_access_settings = ()["command_refresh_all_access_settings_4504699139471874"],
		reset_actuator_settings = ()["command_reset_actuator_settings_4504699139340802"],
		reset_io_1W_and_key = ()["command_reset_io_1W_and_key_4504699139340802"],
		set_area_lighting_activation = ()["command_set_area_lighting_activation_4504699139471874"],
		set_area_lighting_tempo = ()["command_set_area_lighting_tempo_4504699139471874"],
		set_auxiliary_control_activation = ()["command_set_auxiliary_control_activation_4504699139471874"],
		set_auxiliary_control_tempo = ()["command_set_auxiliary_control_tempo_4504699139471874"],
		set_cells_activation = ()["command_set_cells_activation_4504699139340802"],
		set_close_long_tempo_partial_mode = ()["command_set_close_long_tempo_partial_mode_4504699139471874"],
		set_close_short_tempo_partial_mode = ()["command_set_close_short_tempo_partial_mode_4504699139471874"],
		set_close_tempo_total_mode = ()["command_set_close_tempo_total_mode_4504699139471874"],
		set_cruising_speed_type_closing = ()["command_set_cruising_speed_type_closing_4504699139471874"],
		set_cruising_speed_type_opening = ()["command_set_cruising_speed_type_opening_4504699139471874"],
		set_docking_area_speed_closing = ()["command_set_docking_area_speed_closing_4504699139471874"],
		set_docking_area_speed_opening = ()["command_set_docking_area_speed_opening_4504699139471874"],
		set_docking_area_type_in_closing = ()["command_set_docking_area_type_in_closing_4504699139471874"],
		set_docking_area_type_in_opening = ()["command_set_docking_area_type_in_opening_4504699139471874"],
		set_lock_output = ()["command_set_lock_output_4504699139471874"],
		set_lock_release = ()["command_set_lock_release_4504699139471874"],
		set_mode_user_partial = ()["command_set_mode_user_partial_4504699139471874"],
		set_mode_user_total = ()["command_set_mode_user_total_4504699139340802"],
		set_motor1_closing_slowdown_torque_limitation = ()["command_set_motor1_closing_slowdown_torque_limitation_4504699139471874"],
		set_motor1_closing_torque_limitation = ()["command_set_motor1_closing_torque_limitation_4504699139471874"],
		set_motor1_opening_slowdown_torque_limitation = ()["command_set_motor1_opening_slowdown_torque_limitation_4504699139471874"],
		set_motor1_opening_torque_limitation = ()["command_set_motor1_opening_torque_limitation_4504699139471874"],
		set_motor2_closing_slowdown_torque_limitation = ()["command_set_motor2_closing_slowdown_torque_limitation_4504699139471874"],
		set_motor2_closing_torque_limitation = ()["command_set_motor2_closing_torque_limitation_4504699139471874"],
		set_motor2_opening_slowdown_torque_limitation = ()["command_set_motor2_opening_slowdown_torque_limitation_4504699139471874"],
		set_motor2_opening_torque_limitation = ()["command_set_motor2_opening_torque_limitation_4504699139471874"],
		set_motor_shift_in_closing = ()["command_set_motor_shift_in_closing_4504699139471874"],
		set_motor_shift_in_opening = ()["command_set_motor_shift_in_opening_4504699139471874"],
		set_orange_light_prelighting = ()["command_set_orange_light_prelighting_4504699139471874"],
		set_programmable_safety_input = ()["command_set_programmable_safety_input_4504699139471874"],
		set_programmable_safety_input_action = ()["command_set_programmable_safety_input_action_4504699139471874"],
		set_programmable_safety_input_function = ()["command_set_programmable_safety_input_function_4504699139471874"],
		set_settings_lock_status = ()["command_set_settings_lock_status_4504699139340802"],
		set_wired_control = ()["command_set_wired_control_4504699139471874"],
		start_autolearning = ()["command_start_autolearning_4504699139340802"]
	},
	commands_4504699139653634 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139653634"]
	},
	commands_4504699139981826 = {
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		set_recovered_state_after_power_cut = ()["command_set_recovered_state_after_power_cut_4504699139391490"],
		set_timeout_timer = ()["command_set_timeout_timer_4504699139981826"],
		set_timeout_timer_value = ()["command_set_timeout_timer_value_4504699139981826"],
		set_wired_input_type = ()["command_set_wired_input_type_4504699139391490"]
	},
	commands_4504699140046850 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"]
	},
	commands_4504699140047106 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139194882"],
		invert_rotation = ()["command_invert_rotation_4504699139129602"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139129346"],
		set_dbe_up = ()["command_set_dbe_up_4504699140047106"],
		set_unstressing_status = ()["command_set_unstressing_status_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139129346"]
	},
	commands_4504699140112386 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_auxiliary_parameter_settings_mode = ()["command_enter_auxiliary_parameter_settings_mode_4504699139129602"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139194882"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_evb_tilting_travel = ()["command_save_evb_tilting_travel_4504699140112386"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139194882"]
	},
	commands_4504699140243458 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		set_running_time_up = ()["command_set_running_time_up_4504699140243458"],
		set_tilting_time = ()["command_set_tilting_time_4504699140243458"]
	},
	commands_4504699140389378 = {
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		set_timeout_timer = ()["command_set_timeout_timer_4504699139981826"],
		set_timeout_timer_value = ()["command_set_timeout_timer_value_4504699139981826"]
	},
	commands_4504699140768002 = {
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		read_end_limits_states = ()["command_read_end_limits_states_4504699140768002"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		reset_end_limits = ()["command_reset_end_limits_4504699140768002"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		set_application = ()["command_set_application_4504699140768002"],
		set_timeout_timer = ()["command_set_timeout_timer_4504699139981826"],
		set_timeout_timer_value = ()["command_set_timeout_timer_value_4504699139981826"],
		set_ventilation_lock = ()["command_set_ventilation_lock_4504699140768002"]
	},
	commands_4504699140898818 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699140898818"]
	},
	commands_4505798650757122 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"]
	},
	commands_4505798651034114 = {
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"]
	},
	commands_4505798651674882 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139194882"],
		invert_rotation = ()["command_invert_rotation_4504699139129602"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139129346"],
		set_auto_end_limits = ()["command_set_auto_end_limits_4504699139194882"],
		set_dbe_up = ()["command_set_dbe_up_4504699140047106"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139129346"]
	},
	commands_4505798652395778 = {
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		read_end_limits_states = ()["command_read_end_limits_states_4504699140768002"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		reset_end_limits = ()["command_reset_end_limits_4504699140768002"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		set_application = ()["command_set_application_4504699140768002"],
		set_eld_level = ()["command_set_eld_level_4505798652395778"],
		set_timeout_timer = ()["command_set_timeout_timer_4504699139981826"],
		set_timeout_timer_value = ()["command_set_timeout_timer_value_4504699139981826"],
		set_ventilation_lock = ()["command_set_ventilation_lock_4504699140768002"]
	},
	commands_4506898162384898 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4506898162384898"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4506898162384898"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4506898162384898"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4506898162384898"]
	},
	commands_4506898162385154 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4506898162385154"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4506898162384898"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4506898162384898"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139194882"]
	},
	commands_4506898163302402 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_back_impulse_setting_mode = ()["command_enter_back_impulse_setting_mode_4506898163302402"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_back_impulse_position = ()["command_save_back_impulse_position_4506898163302402"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_dbe_up = ()["command_set_dbe_up_4504699140047106"],
		set_unstressing_status = ()["command_set_unstressing_status_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4506898162384898"]
	},
	commands_4507997674012674 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139194882"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4506898162384898"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4506898162384898"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4506898162384898"]
	},
	commands_4507997674930178 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_back_impulse_setting_mode = ()["command_enter_back_impulse_setting_mode_4506898163302402"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_back_impulse_position = ()["command_save_back_impulse_position_4506898163302402"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_application = ()["command_set_application_4507997674930178"],
		set_dbe_up = ()["command_set_dbe_up_4504699140047106"],
		set_unstressing_status = ()["command_set_unstressing_status_4504699139194882"],
		set_x_time = ()["command_set_x_time_4507997674930178"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4506898162384898"]
	},
	commands_4509097185705986 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_back_impulse_setting_mode = ()["command_enter_back_impulse_setting_mode_4506898163302402"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139194882"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_auxiliary_end_limit_entry = ()["command_save_auxiliary_end_limit_entry_4504699139194882"],
		save_auxiliary_end_limit_exit = ()["command_save_auxiliary_end_limit_exit_4504699139194882"],
		save_back_impulse_position = ()["command_save_back_impulse_position_4506898163302402"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_auto_end_limits = ()["command_set_auto_end_limits_4504699139194882"],
		set_curtain_outstretching_level = ()["command_set_curtain_outstretching_level_4504699139194882"],
		set_obstacle_detection = ()["command_set_obstacle_detection_4504699139194882"],
		set_type_lock = ()["command_set_type_lock_4504699139194882"],
		set_unstressing_status = ()["command_set_unstressing_status_4504699139194882"],
		set_x_time = ()["command_set_x_time_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139194882"]
	},
	commands_4509097186557954 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_back_impulse_setting_mode = ()["command_enter_back_impulse_setting_mode_4506898163302402"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139194882"],
		invert_rotation = ()["command_invert_rotation_4504699139129602"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_back_impulse_position = ()["command_save_back_impulse_position_4506898163302402"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139129346"],
		set_dbe_up = ()["command_set_dbe_up_4504699140047106"],
		set_unstressing_status = ()["command_set_unstressing_status_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139129346"]
	},
	commands_4509097186623490 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_auxiliary_parameter_settings_mode = ()["command_enter_auxiliary_parameter_settings_mode_4504699139129602"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139194882"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_evb_tilting_travel = ()["command_save_evb_tilting_travel_4504699140112386"],
		save_flat_slats_position = ()["command_save_flat_slats_position_4504699139129602"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139194882"]
	},
	commands_4510196697268226 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4510196697268226"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139129346"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139129346"]
	},
	commands_4510196698185730 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_back_impulse_setting_mode = ()["command_enter_back_impulse_setting_mode_4506898163302402"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139194882"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_back_impulse_position = ()["command_save_back_impulse_position_4506898163302402"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4506898162384898"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4510196698185730"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4506898162384898"],
		set_dbe_up = ()["command_set_dbe_up_4504699140047106"],
		set_unstressing_status = ()["command_set_unstressing_status_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139194882"]
	},
	commands_4511296209813506 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_back_impulse_setting_mode = ()["command_enter_back_impulse_setting_mode_4506898163302402"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139194882"],
		invert_rotation = ()["command_invert_rotation_4504699139129602"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_back_impulse_position = ()["command_save_back_impulse_position_4506898163302402"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4506898162384898"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4510196698185730"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4506898162384898"],
		set_dbe_up = ()["command_set_dbe_up_4504699140047106"],
		set_unstressing_status = ()["command_set_unstressing_status_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139194882"]
	},
	commands_4512395720523778 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4506898162385154"],
		invert_rotation = ()["command_invert_rotation_4504699139129602"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4506898162384898"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4512395720523778"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4506898162384898"],
		set_auto_end_limits = ()["command_set_auto_end_limits_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139194882"]
	},
	commands_4512395720866306 = {
		calibrate_bus_cells = ()["command_calibrate_bus_cells_4504699139340802"],
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139340802"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139340802"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139340802"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139340802"],
		invert_rotation = ()["command_invert_rotation_4504699139340802"],
		refresh_all_access_settings = ()["command_refresh_all_access_settings_4512395720866306"],
		reset_actuator_settings = ()["command_reset_actuator_settings_4504699139340802"],
		reset_io_1W_and_key = ()["command_reset_io_1W_and_key_4504699139340802"],
		set_area_lighting_activation = ()["command_set_area_lighting_activation_4504699139471874"],
		set_area_lighting_tempo = ()["command_set_area_lighting_tempo_4504699139471874"],
		set_auxiliary_control_activation = ()["command_set_auxiliary_control_activation_4504699139471874"],
		set_auxiliary_control_tempo = ()["command_set_auxiliary_control_tempo_4504699139471874"],
		set_cells_activation = ()["command_set_cells_activation_4504699139340802"],
		set_close_long_tempo_partial_mode = ()["command_set_close_long_tempo_partial_mode_4504699139471874"],
		set_close_short_tempo_partial_mode = ()["command_set_close_short_tempo_partial_mode_4504699139471874"],
		set_close_tempo_total_mode = ()["command_set_close_tempo_total_mode_4504699139471874"],
		set_cruising_speed_type_closing = ()["command_set_cruising_speed_type_closing_4504699139471874"],
		set_cruising_speed_type_opening = ()["command_set_cruising_speed_type_opening_4504699139471874"],
		set_docking_area_speed_closing = ()["command_set_docking_area_speed_closing_4504699139471874"],
		set_docking_area_speed_opening = ()["command_set_docking_area_speed_opening_4504699139471874"],
		set_docking_area_type_in_closing = ()["command_set_docking_area_type_in_closing_4504699139471874"],
		set_docking_area_type_in_opening = ()["command_set_docking_area_type_in_opening_4504699139471874"],
		set_mode_user_partial = ()["command_set_mode_user_partial_4504699139471874"],
		set_mode_user_total = ()["command_set_mode_user_total_4504699139340802"],
		set_motor1_closing_slowdown_torque_limitation = ()["command_set_motor1_closing_slowdown_torque_limitation_4504699139471874"],
		set_motor1_closing_torque_limitation = ()["command_set_motor1_closing_torque_limitation_4504699139471874"],
		set_motor1_opening_slowdown_torque_limitation = ()["command_set_motor1_opening_slowdown_torque_limitation_4504699139471874"],
		set_motor1_opening_torque_limitation = ()["command_set_motor1_opening_torque_limitation_4504699139471874"],
		set_orange_light_prelighting = ()["command_set_orange_light_prelighting_4504699139471874"],
		set_pop_value = ()["command_set_pop_value_4512395720866306"],
		set_programmable_safety_input = ()["command_set_programmable_safety_input_4504699139471874"],
		set_programmable_safety_input_action = ()["command_set_programmable_safety_input_action_4504699139471874"],
		set_programmable_safety_input_function = ()["command_set_programmable_safety_input_function_4504699139471874"],
		set_resistance_sensitivity = ()["command_set_resistance_sensitivity_4504699139340802"],
		set_safety_edge_activation = ()["command_set_safety_edge_activation_4512395720866306"],
		set_settings_lock_status = ()["command_set_settings_lock_status_4504699139340802"],
		set_wired_control = ()["command_set_wired_control_4504699139471874"],
		start_autolearning = ()["command_start_autolearning_4504699139340802"]
	},
	commands_4512395721441282 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_back_impulse_setting_mode = ()["command_enter_back_impulse_setting_mode_4506898163302402"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139194882"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_back_impulse_position = ()["command_save_back_impulse_position_4506898163302402"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_dbe_up = ()["command_set_dbe_up_4504699140047106"],
		set_unstressing_status = ()["command_set_unstressing_status_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139194882"]
	},
	commands_4513495232217090 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139194882"],
		invert_rotation = ()["command_invert_rotation_4504699139129602"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139129346"],
		set_dbe_down = ()["command_set_dbe_down_4513495232217090"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139129346"]
	},
	commands_4513495233134594 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"]
	},
	commands_4515694255407106 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4510196697268226"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4506898162384898"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4506898162384898"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139194882"]
	},
	commands_4515694256324610 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_back_impulse_setting_mode = ()["command_enter_back_impulse_setting_mode_4506898163302402"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129602"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_back_impulse_position = ()["command_save_back_impulse_position_4506898163302402"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139129346"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139129346"]
	},
	commands_4516793767377410 = {
		calibrate_bus_cells = ()["command_calibrate_bus_cells_4516793767377410"],
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139340802"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139340802"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139340802"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139340802"],
		invert_rotation = ()["command_invert_rotation_4504699139340802"],
		read_photocells_input_status = ()["command_read_photocells_input_status_4504699139340802"],
		refresh_all_access_settings = ()["command_refresh_all_access_settings_4516793767377410"],
		reset_actuator_param = ()["command_reset_actuator_param_4504699139340802"],
		reset_actuator_settings = ()["command_reset_actuator_settings_4504699139340802"],
		reset_io_1W_and_key = ()["command_reset_io_1W_and_key_4504699139340802"],
		save_partial_position = ()["command_save_partial_position_4516793767377410"],
		set_cells_activation = ()["command_set_cells_activation_4504699139340802"],
		set_close_tempo_total_mode = ()["command_set_close_tempo_total_mode_4504699139340802"],
		set_cruising_speed_type_closing = ()["command_set_cruising_speed_type_closing_4504699139340802"],
		set_cruising_speed_type_opening = ()["command_set_cruising_speed_type_opening_4504699139340802"],
		set_docking_area_speed_closing = ()["command_set_docking_area_speed_closing_4504699139340802"],
		set_docking_area_type_in_closing = ()["command_set_docking_area_type_in_closing_4504699139340802"],
		set_docking_area_type_in_opening = ()["command_set_docking_area_type_in_opening_4504699139340802"],
		set_mode_user_total = ()["command_set_mode_user_total_4504699139340802"],
		set_resistance_sensitivity = ()["command_set_resistance_sensitivity_4504699139340802"],
		set_safety_edge_activation = ()["command_set_safety_edge_activation_4516793767377410"],
		set_settings_lock_status = ()["command_set_settings_lock_status_4504699139340802"],
		start_autolearning = ()["command_start_autolearning_4504699139340802"]
	},
	commands_4516793767952386 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_back_impulse_setting_mode = ()["command_enter_back_impulse_setting_mode_4506898163302402"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_back_impulse_position = ()["command_save_back_impulse_position_4506898163302402"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139129346"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139129346"]
	},
	commands_4517893278728194 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139194882"],
		invert_rotation = ()["command_invert_rotation_4504699139129602"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4506898162384898"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4510196698185730"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4506898162384898"],
		set_dbe_down = ()["command_set_dbe_down_4513495232217090"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139194882"]
	},
	commands_4517893278874114 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139340802"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139340802"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139340802"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139340802"],
		invert_rotation = ()["command_invert_rotation_4504699139340802"],
		read_photocells_input_status = ()["command_read_photocells_input_status_4504699139340802"],
		refresh_all_access_settings = ()["command_refresh_all_access_settings_4517893278874114"],
		reset_actuator_param = ()["command_reset_actuator_param_4504699139340802"],
		reset_actuator_settings = ()["command_reset_actuator_settings_4504699139340802"],
		reset_io_1W_and_key = ()["command_reset_io_1W_and_key_4504699139340802"],
		set_auxiliary_control_activation = ()["command_set_auxiliary_control_activation_4517893278874114"],
		set_cells_activation = ()["command_set_cells_activation_4504699139340802"],
		set_close_tempo_total_mode = ()["command_set_close_tempo_total_mode_4517893278874114"],
		set_mode_user_total = ()["command_set_mode_user_total_4504699139340802"],
		set_safety_edge_technology = ()["command_set_safety_edge_technology_4517893278874114"],
		set_settings_lock_status = ()["command_set_settings_lock_status_4504699139340802"]
	},
	commands_4517893279645698 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_auxiliary_parameter_settings_mode = ()["command_enter_auxiliary_parameter_settings_mode_4504699139129602"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_evb_tilting_travel = ()["command_save_evb_tilting_travel_4504699140112386"],
		save_flat_slats_position = ()["command_save_flat_slats_position_4504699139129602"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699140898818"]
	},
	commands_4520092301918210 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699140898818"]
	},
	commands_4521191813545986 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4521191813545986"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4521191813545986"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_settings = ()["command_save_settings_4521191813545986"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_auto_end_limits = ()["command_set_auto_end_limits_4521191813545986"],
		set_auto_lower_end_limit = ()["command_set_auto_lower_end_limit_4521191813545986"],
		set_auto_upper_end_limit = ()["command_set_auto_upper_end_limit_4521191813545986"],
		set_discreet_mode_speed = ()["command_set_discreet_mode_speed_4521191813545986"],
		set_nominal_mode_speed = ()["command_set_nominal_mode_speed_4521191813545986"],
		set_open_level = ()["command_set_open_level_4521191813545986"],
		set_security_level = ()["command_set_security_level_4521191813545986"],
		set_smart_protect = ()["command_set_smart_protect_4521191813545986"],
		set_soft_start = ()["command_set_soft_start_4521191813545986"],
		set_soft_stop = ()["command_set_soft_stop_4521191813545986"]
	},
	commands_4525589860057090 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4521191813545986"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4521191813545986"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4521191813545986"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_auto_end_limits = ()["command_set_auto_end_limits_4521191813545986"],
		set_auto_lower_end_limit = ()["command_set_auto_lower_end_limit_4521191813545986"],
		set_auto_upper_end_limit = ()["command_set_auto_upper_end_limit_4521191813545986"],
		set_discreet_mode_speed = ()["command_set_discreet_mode_speed_4521191813545986"],
		set_nominal_mode_speed = ()["command_set_nominal_mode_speed_4521191813545986"],
		set_open_level = ()["command_set_open_level_4521191813545986"],
		set_security_level = ()["command_set_security_level_4521191813545986"],
		set_soft_start = ()["command_set_soft_start_4521191813545986"],
		set_soft_stop = ()["command_set_soft_stop_4521191813545986"]
	},
	commands_4527788883655170 = {
		calibrate_bus_cells = ()["command_calibrate_bus_cells_4504699139340802"],
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139340802"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139340802"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139340802"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139340802"],
		invert_rotation = ()["command_invert_rotation_4504699139340802"],
		refresh_all_access_settings = ()["command_refresh_all_access_settings_4527788883655170"],
		reset_actuator_settings = ()["command_reset_actuator_settings_4504699139340802"],
		reset_io_1W_and_key = ()["command_reset_io_1W_and_key_4504699139340802"],
		set_additional_thrust_in_closing = ()["command_set_additional_thrust_in_closing_4527788883655170"],
		set_area_lighting_activation = ()["command_set_area_lighting_activation_4504699139471874"],
		set_area_lighting_tempo = ()["command_set_area_lighting_tempo_4504699139471874"],
		set_auxiliary_control_activation = ()["command_set_auxiliary_control_activation_4504699139471874"],
		set_auxiliary_control_tempo = ()["command_set_auxiliary_control_tempo_4504699139471874"],
		set_cells_activation = ()["command_set_cells_activation_4504699139340802"],
		set_close_long_tempo_partial_mode = ()["command_set_close_long_tempo_partial_mode_4504699139471874"],
		set_close_short_tempo_partial_mode = ()["command_set_close_short_tempo_partial_mode_4504699139471874"],
		set_close_tempo_total_mode = ()["command_set_close_tempo_total_mode_4504699139471874"],
		set_cruising_speed_type_closing = ()["command_set_cruising_speed_type_closing_4504699139471874"],
		set_cruising_speed_type_opening = ()["command_set_cruising_speed_type_opening_4504699139471874"],
		set_docking_area_speed_closing = ()["command_set_docking_area_speed_closing_4504699139471874"],
		set_docking_area_speed_opening = ()["command_set_docking_area_speed_opening_4504699139471874"],
		set_docking_area_type_in_closing = ()["command_set_docking_area_type_in_closing_4504699139471874"],
		set_docking_area_type_in_opening = ()["command_set_docking_area_type_in_opening_4504699139471874"],
		set_lock_output = ()["command_set_lock_output_4504699139471874"],
		set_lock_release = ()["command_set_lock_release_4504699139471874"],
		set_mode_user_partial = ()["command_set_mode_user_partial_4504699139471874"],
		set_mode_user_total = ()["command_set_mode_user_total_4504699139340802"],
		set_motor1_closing_slowdown_torque_limitation = ()["command_set_motor1_closing_slowdown_torque_limitation_4504699139471874"],
		set_motor1_closing_torque_limitation = ()["command_set_motor1_closing_torque_limitation_4504699139471874"],
		set_motor1_opening_slowdown_torque_limitation = ()["command_set_motor1_opening_slowdown_torque_limitation_4504699139471874"],
		set_motor1_opening_torque_limitation = ()["command_set_motor1_opening_torque_limitation_4504699139471874"],
		set_motor2_closing_slowdown_torque_limitation = ()["command_set_motor2_closing_slowdown_torque_limitation_4504699139471874"],
		set_motor2_closing_torque_limitation = ()["command_set_motor2_closing_torque_limitation_4504699139471874"],
		set_motor2_opening_slowdown_torque_limitation = ()["command_set_motor2_opening_slowdown_torque_limitation_4504699139471874"],
		set_motor2_opening_torque_limitation = ()["command_set_motor2_opening_torque_limitation_4504699139471874"],
		set_motor_shift_in_closing = ()["command_set_motor_shift_in_closing_4504699139471874"],
		set_motor_shift_in_opening = ()["command_set_motor_shift_in_opening_4504699139471874"],
		set_orange_light_prelighting = ()["command_set_orange_light_prelighting_4504699139471874"],
		set_programmable_safety_input = ()["command_set_programmable_safety_input_4504699139471874"],
		set_programmable_safety_input_action = ()["command_set_programmable_safety_input_action_4504699139471874"],
		set_programmable_safety_input_function = ()["command_set_programmable_safety_input_function_4504699139471874"],
		set_settings_lock_status = ()["command_set_settings_lock_status_4504699139340802"],
		set_wired_control = ()["command_set_wired_control_4504699139471874"],
		start_autolearning = ()["command_start_autolearning_4504699139340802"]
	},
	commands_4531087418195970 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4521191813545986"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4521191813545986"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4521191813545986"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_auto_end_limits = ()["command_set_auto_end_limits_4521191813545986"],
		set_auto_lower_end_limit = ()["command_set_auto_lower_end_limit_4521191813545986"],
		set_auto_upper_end_limit = ()["command_set_auto_upper_end_limit_4521191813545986"],
		set_discreet_mode_speed = ()["command_set_discreet_mode_speed_4521191813545986"],
		set_nominal_mode_speed = ()["command_set_nominal_mode_speed_4521191813545986"],
		set_open_level = ()["command_set_open_level_4521191813545986"],
		set_security_level = ()["command_set_security_level_4521191813545986"],
		set_smart_protect = ()["command_set_smart_protect_4521191813545986"],
		set_soft_start = ()["command_set_soft_start_4521191813545986"],
		set_soft_stop = ()["command_set_soft_stop_4521191813545986"]
	},
	commands_4531087419179010 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_auxiliary_parameter_settings_mode = ()["command_enter_auxiliary_parameter_settings_mode_4531087419179010"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_evb_tilting_travel = ()["command_save_evb_tilting_travel_4531087419179010"],
		save_flat_slats_position = ()["command_save_flat_slats_position_4504699139129602"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_choregraphy_disable_variator_down_move_min = ()["command_set_choregraphy_disable_variator_down_move_min_4531087419179010"],
		set_choregraphy_disable_variator_up_move_min = ()["command_set_choregraphy_disable_variator_up_move_min_4531087419179010"],
		set_choregraphy_enable_variator_down_move_min = ()["command_set_choregraphy_enable_variator_down_move_min_4531087419179010"],
		set_choregraphy_enable_variator_up_move_min = ()["command_set_choregraphy_enable_variator_up_move_min_4531087419179010"],
		set_evb_tilting_travel_pulse = ()["command_set_evb_tilting_travel_pulse_4531087419179010"],
		set_kinematics = ()["command_set_kinematics_4531087419179010"],
		set_obstacle_detection = ()["command_set_obstacle_detection_4531087419179010"],
		set_x_time = ()["command_set_x_time_4531087419179010"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699140898818"]
	},
	commands_4535485464772610 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_back_impulse_setting_mode = ()["command_enter_back_impulse_setting_mode_4506898163302402"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_back_impulse_position = ()["command_save_back_impulse_position_4506898163302402"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_application = ()["command_set_application_4507997674930178"],
		set_dbe_up = ()["command_set_dbe_up_4504699140047106"],
		set_unstressing_status = ()["command_set_unstressing_status_4535485464772610"],
		set_x_time = ()["command_set_x_time_4507997674930178"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4506898162384898"]
	},
	commands_4535485465690114 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4521191813545986"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4521191813545986"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_auxiliary_parameter_settings_mode = ()["command_enter_auxiliary_parameter_settings_mode_4531087419179010"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_evb_tilting_travel = ()["command_save_evb_tilting_travel_4531087419179010"],
		save_flat_slats_position = ()["command_save_flat_slats_position_4504699139129602"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_choregraphy_disable_variator_down_move_min = ()["command_set_choregraphy_disable_variator_down_move_min_4531087419179010"],
		set_choregraphy_disable_variator_up_move_min = ()["command_set_choregraphy_disable_variator_up_move_min_4531087419179010"],
		set_choregraphy_enable_variator_down_move_min = ()["command_set_choregraphy_enable_variator_down_move_min_4531087419179010"],
		set_choregraphy_enable_variator_up_move_min = ()["command_set_choregraphy_enable_variator_up_move_min_4531087419179010"],
		set_evb_tilting_travel_pulse = ()["command_set_evb_tilting_travel_pulse_4531087419179010"],
		set_kinematics = ()["command_set_kinematics_4531087419179010"],
		set_obstacle_detection = ()["command_set_obstacle_detection_4531087419179010"],
		set_x_time = ()["command_set_x_time_4531087419179010"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699140898818"]
	},
	commands_4554177162379266 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4521191813545986"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4521191813545986"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4521191813545986"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_auto_end_limits = ()["command_set_auto_end_limits_4521191813545986"],
		set_auto_lower_end_limit = ()["command_set_auto_lower_end_limit_4521191813545986"],
		set_auto_upper_end_limit = ()["command_set_auto_upper_end_limit_4521191813545986"],
		set_discreet_mode_speed = ()["command_set_discreet_mode_speed_4521191813545986"],
		set_knx = ()["command_set_knx_4554177162379266"],
		set_nominal_mode_speed = ()["command_set_nominal_mode_speed_4521191813545986"],
		set_open_level = ()["command_set_open_level_4521191813545986"],
		set_security_level = ()["command_set_security_level_4521191813545986"],
		set_smart_protect = ()["command_set_smart_protect_4521191813545986"],
		set_soft_start = ()["command_set_soft_start_4521191813545986"],
		set_soft_stop = ()["command_set_soft_stop_4521191813545986"]
	},
	commands_4581664953073666 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4504699139129346"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4504699139129346"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4510196697268226"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139129346"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4504699139129346"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139129346"],
		start_auto_learning = ()["command_start_auto_learning_4581664953073666"],
		stop_after_save_limit = ()["command_stop_after_save_limit_4504699139129346"]
	},
	commands_4584963487956994 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4521191813545986"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4521191813545986"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4521191813545986"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_OEM_Battery_Name = ()["command_set_OEM_Battery_Name_4584963487956994"],
		set_OEM_Battery_Reference = ()["command_set_OEM_Battery_Reference_4584963487956994"],
		set_OEM_SolarPanel_Name = ()["command_set_OEM_SolarPanel_Name_4584963487956994"],
		set_OEM_SolarPanel_Reference = ()["command_set_OEM_SolarPanel_Reference_4584963487956994"],
		set_auto_end_limits = ()["command_set_auto_end_limits_4521191813545986"],
		set_auto_lower_end_limit = ()["command_set_auto_lower_end_limit_4521191813545986"],
		set_auto_upper_end_limit = ()["command_set_auto_upper_end_limit_4521191813545986"],
		set_discreet_mode_speed = ()["command_set_discreet_mode_speed_4521191813545986"],
		set_nominal_mode_speed = ()["command_set_nominal_mode_speed_4521191813545986"],
		set_open_level = ()["command_set_open_level_4521191813545986"],
		set_security_level = ()["command_set_security_level_4521191813545986"],
		set_smart_protect = ()["command_set_smart_protect_4521191813545986"],
		set_soft_start = ()["command_set_soft_start_4521191813545986"],
		set_soft_stop = ()["command_set_soft_stop_4521191813545986"]
	},
	commands_4587162511212546 = {
		dead_man_down = ()["command_dead_man_down_4504699139129346"],
		dead_man_impulse_down = ()["command_dead_man_impulse_down_4521191813545986"],
		dead_man_impulse_up = ()["command_dead_man_impulse_up_4521191813545986"],
		dead_man_stop = ()["command_dead_man_stop_4504699139129346"],
		dead_man_up = ()["command_dead_man_up_4504699139129346"],
		delete_my_position = ()["command_delete_my_position_4504699139129346"],
		double_power_cut = ()["command_double_power_cut_4504699139129346"],
		eject_from_setting_mode = ()["command_eject_from_setting_mode_4504699139129346"],
		enter_settings_mode = ()["command_enter_settings_mode_4504699139129346"],
		invert_rotation = ()["command_invert_rotation_4504699139129346"],
		reset_actuator = ()["command_reset_actuator_4504699139129346"],
		save_lower_end_limit = ()["command_save_lower_end_limit_4504699139194882"],
		save_my_position = ()["command_save_my_position_4504699139129346"],
		save_settings = ()["command_save_settings_4521191813545986"],
		save_upper_end_limit = ()["command_save_upper_end_limit_4504699139194882"],
		set_OEM_Battery_Name = ()["command_set_OEM_Battery_Name_4584963487956994"],
		set_OEM_Battery_Reference = ()["command_set_OEM_Battery_Reference_4584963487956994"],
		set_OEM_SolarPanel_Name = ()["command_set_OEM_SolarPanel_Name_4584963487956994"],
		set_OEM_SolarPanel_Reference = ()["command_set_OEM_SolarPanel_Reference_4584963487956994"],
		set_auto_end_limits = ()["command_set_auto_end_limits_4521191813545986"],
		set_auto_lower_end_limit = ()["command_set_auto_lower_end_limit_4521191813545986"],
		set_auto_upper_end_limit = ()["command_set_auto_upper_end_limit_4521191813545986"],
		set_discreet_mode_speed = ()["command_set_discreet_mode_speed_4521191813545986"],
		set_open_level = ()["command_set_open_level_4521191813545986"],
		set_security_level = ()["command_set_security_level_4521191813545986"],
		set_smart_protect = ()["command_set_smart_protect_4521191813545986"],
		set_soft_start = ()["command_set_soft_start_4521191813545986"],
		set_soft_stop = ()["command_set_soft_stop_4521191813545986"]
	},
	states_4504699139129346 = {
		current_position = ({
			state_Prohibit_changes_of_Unroll_End_Limit_4531087419179010 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059664,
				type = "string",
				params = {
					[1.0] = "0xA610"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 137
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "disable",
								1 = "enable"
							}
						}
					}
				}
			},
			state_additional_thrust_in_closing_4527788883655170 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058404,
				type = "string",
				params = {
					[1.0] = "0xA124"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "short",
								1 = "long"
							}
						}
					}
				}
			},
			state_application_4504699140243458 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "int",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 26
						}
					}
				}
			},
			state_application_4504699140768002 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 26
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								60 = "two_panels_pull_right_to_open",
								59 = "two_panels_pull_left_to_open"
							}
						}
					}
				}
			},
			state_application_4507997674930178 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 26
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								44 = "valance",
								10 = "pergola_vertical_screen",
								58 = "lateral_arm_awning",
								9 = "external_vertical_screen"
							}
						}
					}
				}
			},
			state_area_lighting_activation_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058397,
				type = "string",
				params = {
					[1.0] = "0xA11D"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "auto",
								1 = "controlled",
								2 = "auto_+_controlled"
							}
						}
					}
				}
			},
			state_area_lighting_tempo_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058398,
				type = "int",
				params = {
					[1.0] = "0xA11E"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "operation",
						params = {
							[1.0] = "*",
							[2.0] = 10
						}
					}
				}
			},
			state_autolearning_state_4504699139340802 = {
				baseCommand = "readPrivate",
				refreshAll = false,
				stateId = 49217792,
				type = "string",
				params = {
					{
						"0x02",
						"0xEF",
						"0x01"
					}
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 4,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0x70 = "ended_OK",
								0x72 = "ended_error",
								0x21 = "running",
								0x00 = "unknown",
								0x11 = "started",
								0x41 = "cancelled"
							}
						}
					}
				}
			},
			state_autolearning_state_4504699139471874 = {
				baseCommand = "readPrivate",
				refreshAll = false,
				stateId = 49217792,
				type = "string",
				params = {
					{
						"0x02",
						"0xEF",
						"0x01"
					}
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 4,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "unknown",
								65 = "cancelled",
								112 = "ended_OK",
								33 = "running",
								17 = "started",
								114 = "ended_error"
							}
						}
					}
				}
			},
			state_automatic_adjustment_allowed_4531087419179010 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059664,
				type = "string",
				params = {
					[1.0] = "0xA610"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 135
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "disable",
								1 = "enable"
							}
						}
					}
				}
			},
			state_auxiliary_control_activation_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058399,
				type = "string",
				params = {
					[1.0] = "0xA11F"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "inactive",
								1 = "auto_mode_open_gate_light",
								6 = "drived_bistable_tempo",
								2 = "auto_mode_bistable_tempo",
								5 = "drived_impulse",
								3 = "auto_mode_impulse",
								4 = "drived_bistable"
							}
						}
					}
				}
			},
			state_auxiliary_control_activation_4517893278874114 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058399,
				type = "string",
				params = {
					[1.0] = "0xA11F"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								8 = "area_lighting",
								10 = "orange_light"
							}
						}
					}
				}
			},
			state_auxiliary_control_tempo_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058400,
				type = "int",
				params = {
					[1.0] = "0xA120"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "operation",
						params = {
							[1.0] = "*",
							[2.0] = 10
						}
					}
				}
			},
			state_cells_activation_4504699139340802 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058391,
				type = "string",
				params = {
					[1.0] = "0xA117"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "inactive",
								1 = "active",
								2 = "active_autotest_output",
								3 = "active_autotest_powered",
								4 = "bus_cells"
							}
						}
					}
				}
			},
			state_choregraphy_disable_variator_down_move_min_4531087419179010 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059659,
				type = "int",
				params = {
					[1.0] = "0xA60B"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 137
						}
					}
				}
			},
			state_choregraphy_disable_variator_up_move_min_4531087419179010 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059659,
				type = "int",
				params = {
					[1.0] = "0xA60B"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 138
						}
					}
				}
			},
			state_choregraphy_enable_variator_down_move_min_4531087419179010 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059659,
				type = "int",
				params = {
					[1.0] = "0xA60B"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 139
						}
					}
				}
			},
			state_choregraphy_enable_variator_up_move_min_4531087419179010 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059659,
				type = "int",
				params = {
					[1.0] = "0xA60B"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 140
						}
					}
				}
			},
			state_close_long_tempo_partial_mode_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058372,
				type = "int",
				params = {
					[1.0] = "0xA104"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "operation",
						params = {
							[1.0] = "*",
							[2.0] = 5
						}
					}
				}
			},
			state_close_short_tempo_partial_mode_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058371,
				type = "int",
				params = {
					[1.0] = "0xA103"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "operation",
						params = {
							[1.0] = "*",
							[2.0] = 10
						}
					}
				}
			},
			state_close_tempo_total_mode_4504699139340802 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058420,
				type = "int",
				params = {
					[1.0] = "0xA134"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 2
						}
					}
				}
			},
			state_close_tempo_total_mode_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058369,
				type = "int",
				params = {
					[1.0] = "0xA101"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "operation",
						params = {
							[1.0] = "*",
							[2.0] = 10
						}
					}
				}
			},
			state_cruising_speed_type_closing_4504699139340802 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058374,
				type = "string",
				params = {
					[1.0] = "0xA106"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								103 = "fast",
								101 = "slow",
								102 = "medium"
							}
						}
					}
				}
			},
			state_cruising_speed_type_closing_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058374,
				type = "int",
				params = {
					[1.0] = "0xA106"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_cruising_speed_type_opening_4504699139340802 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058375,
				type = "string",
				params = {
					[1.0] = "0xA107"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								103 = "fast",
								101 = "slow",
								102 = "medium"
							}
						}
					}
				}
			},
			state_cruising_speed_type_opening_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058375,
				type = "int",
				params = {
					[1.0] = "0xA107"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_current_position_4504699139129346 = {
				baseCommand = "readMP",
				refreshAll = false,
				stateId = 65537,
				type = "int",
				params = {}
			},
			state_current_tilt_4504699139129602 = {
				baseCommand = "readFP",
				refreshAll = true,
				stateId = 65540,
				type = "int",
				params = {
					[1.0] = 3
				}
			},
			state_curtain_outstretching_level_4504699139194882 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059658,
				type = "string",
				params = {
					[1.0] = "0xA60A"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 128
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "low",
								1 = "medium",
								2 = "high"
							}
						}
					}
				}
			},
			state_dbe_up_4504699140047106 = {
				baseCommand = "readPrivate",
				refreshAll = true,
				stateId = 48171008,
				type = "string",
				params = {
					{
						"0x02",
						"0xDF",
						"0x08"
					}
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 3,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "low",
								1 = "medium",
								2 = "high"
							}
						}
					}
				}
			},
			state_detailed_actuator_type_4504699139340802 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058674,
				type = "string",
				params = {
					[1.0] = "0xA232"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								4 = "gdo_horizontal",
								3 = "gdo_vertical",
								2 = "gdo_sectional"
							}
						}
					}
				}
			},
			state_discreet_mode_speed_4521191813545986 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059671,
				type = "int",
				params = {
					[1.0] = "0xA617"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 128
						}
					}
				}
			},
			state_docking_area_speed_closing_4504699139340802 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058411,
				type = "string",
				params = {
					[1.0] = "0xA12B"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								3 = "fast",
								1 = "slow",
								2 = "medium"
							}
						}
					}
				}
			},
			state_docking_area_speed_closing_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058411,
				type = "int",
				params = {
					[1.0] = "0xA12B"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_docking_area_speed_opening_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058412,
				type = "int",
				params = {
					[1.0] = "0xA12C"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_docking_area_type_in_closing_4504699139340802 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058376,
				type = "string",
				params = {
					[1.0] = "0xA108"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								101 = "short",
								100 = "mini",
								102 = "long"
							}
						}
					}
				}
			},
			state_docking_area_type_in_closing_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058376,
				type = "int",
				params = {
					[1.0] = "0xA108"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_docking_area_type_in_opening_4504699139340802 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058377,
				type = "string",
				params = {
					[1.0] = "0xA109"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								101 = "short",
								100 = "mini",
								102 = "long"
							}
						}
					}
				}
			},
			state_docking_area_type_in_opening_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058377,
				type = "int",
				params = {
					[1.0] = "0xA109"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_eld_level_4505798652395778 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059658,
				type = "string",
				params = {
					[1.0] = "0xA60A"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 128
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "low",
								1 = "nominal",
								2 = "high",
								3 = "very_high",
								4 = "very_low"
							}
						}
					}
				}
			},
			state_evb_tilting_travel_4504699139129602 = {
				baseCommand = "readPrivate",
				refreshAll = false,
				stateId = 48177664,
				type = "int",
				params = {
					{
						"0x02",
						"0xDF",
						"0x22"
					}
				}
			},
			state_evb_tilting_travel_pulse_4531087419179010 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059659,
				type = "int",
				params = {
					[1.0] = "0xA60B"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 142
						}
					}
				}
			},
			state_kinematics_4531087419179010 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 6
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "EVB_standard",
								1 = "EVB_alternative",
								3 = "EVB_WP2",
								2 = "EVB_WP1"
							}
						}
					}
				}
			},
			state_knx_4554177162379266 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "int",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 140
						}
					}
				}
			},
			state_load_AC_drive_request_4504699139391490 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059656,
				type = "string",
				params = {
					[1.0] = "0xA608"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 4
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								3 = "leading edge",
								1 = "on off",
								2 = "trailing edge"
							}
						}
					}
				}
			},
			state_lock_output_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058401,
				type = "string",
				params = {
					[1.0] = "0xA121"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "active_pulse_24V",
								1 = "active_pulse_12V",
								255 = "undefined"
							}
						}
					}
				}
			},
			state_lock_release_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058402,
				type = "string",
				params = {
					[1.0] = "0xA122"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "inactive",
								1 = "active"
							}
						}
					}
				}
			},
			state_mode_user_partial_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058370,
				type = "string",
				params = {
					[1.0] = "0xA102"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "same_total_mode",
								1 = "without_auto_closure",
								2 = "with_auto_closure"
							}
						}
					}
				}
			},
			state_mode_user_total_4504699139340802 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058368,
				type = "string",
				params = {
					[1.0] = "0xA100"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "sequential",
								1 = "sequential_short_tempo",
								6 = "sequential_long_tempo_cells_block",
								2 = "semi_auto",
								5 = "deadman",
								3 = "auto",
								4 = "auto_cells_cells_block"
							}
						}
					}
				}
			},
			state_motor1_closing_slowdown_torque_limitation_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058382,
				type = "int",
				params = {
					[1.0] = "0xA10E"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_motor1_closing_torque_limitation_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058380,
				type = "int",
				params = {
					[1.0] = "0xA10C"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_motor1_opening_slowdown_torque_limitation_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058383,
				type = "int",
				params = {
					[1.0] = "0xA10F"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_motor1_opening_torque_limitation_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058381,
				type = "int",
				params = {
					[1.0] = "0xA10D"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_motor2_closing_slowdown_torque_limitation_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058386,
				type = "int",
				params = {
					[1.0] = "0xA112"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_motor2_closing_torque_limitation_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058384,
				type = "int",
				params = {
					[1.0] = "0xA110"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_motor2_opening_slowdown_torque_limitation_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058387,
				type = "int",
				params = {
					[1.0] = "0xA113"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_motor2_opening_torque_limitation_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058385,
				type = "int",
				params = {
					[1.0] = "0xA111"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_motor_shift_in_closing_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058378,
				type = "int",
				params = {
					[1.0] = "0xA10A"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_motor_shift_in_opening_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058379,
				type = "int",
				params = {
					[1.0] = "0xA10B"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_nominal_mode_speed_4521191813545986 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059671,
				type = "int",
				params = {
					[1.0] = "0xA617"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 129
						}
					}
				}
			},
			state_obstacle_detection_4504699139194882 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059658,
				type = "string",
				params = {
					[1.0] = "0xA60A"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 130
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "highest_sensitivity",
								1 = "nominal_sensitivity",
								3 = "no_sensitivity",
								2 = "lowest_sensitivity"
							}
						}
					}
				}
			},
			state_obstacle_detection_4531087419179010 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059658,
				type = "string",
				params = {
					[1.0] = "0xA60A"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 129
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "highest_sensitivity",
								1 = "nominal_sensitivity",
								3 = "no_sensitivity",
								2 = "lowest_sensitivity"
							}
						}
					}
				}
			},
			state_open_level_4521191813545986 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 18
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "close_tcs",
								1 = "medium_tcs",
								2 = "far_tcs"
							}
						}
					}
				}
			},
			state_orange_light_prelighting_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058373,
				type = "string",
				params = {
					[1.0] = "0xA105"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "inactive",
								1 = "active"
							}
						}
					}
				}
			},
			state_paired_1w_controllers_4504699139129346 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 118,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_controllers_4504699139129602 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 99,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_controllers_4504699139653634 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059661,
				type = "int",
				params = {
					[1.0] = "0xA60D"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 128
						}
					}
				}
			},
			state_paired_1w_controllers_4505798650757378 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 103,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_controllers_4507997674012930 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 93,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_controllers_4509097185640450 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 77,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_controllers_4511296208896002 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 98,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_controllers_4512395720523778 = {
				baseCommand = "getData",
				refreshAll = true,
				stateId = 49020928,
				type = "int",
				params = {
					[1.0] = "0x00"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							10,
							1,
							"false"
						}
					}
				}
			},
			state_paired_1w_controllers_4513495232151554 = {
				baseCommand = "getData",
				refreshAll = true,
				stateId = 49020928,
				type = "int",
				params = {
					[1.0] = "0x00"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 10,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_controllers_4513495233134594 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 68,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_controllers_4515694255407106 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 96,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_controllers_4522291326156802 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 79,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_sensors_4504699139129346 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 119,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_sensors_4504699139129602 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 100,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_sensors_4504699139653634 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059661,
				type = "int",
				params = {
					[1.0] = "0xA60D"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 129
						}
					}
				}
			},
			state_paired_1w_sensors_4505798650757378 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 104,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_sensors_4507997674012930 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 94,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_sensors_4509097185640450 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 78,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_sensors_4513495233134594 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 69,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_sensors_4514594743779330 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 105,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_sensors_4515694255407106 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 97,
							[2.0] = 1
						}
					}
				}
			},
			state_paired_1w_sensors_4522291326156802 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "int",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 80,
							[2.0] = 1
						}
					}
				}
			},
			state_photocells_input_status_4504699139340802 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058697,
				type = "string",
				params = {
					[1.0] = "0xA249"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "SC",
								1 = "OC"
							}
						}
					}
				}
			},
			state_pop_value_4512395720866306 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058406,
				type = "int",
				params = {
					[1.0] = "0xA126"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					}
				}
			},
			state_programmable_safety_input_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058393,
				type = "string",
				params = {
					[1.0] = "0xA119"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "inactive",
								1 = "active",
								2 = "active_autotest_output",
								3 = "active_autotest_powered",
								4 = "active_bus_cells"
							}
						}
					}
				}
			},
			state_programmable_safety_input_action_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058395,
				type = "string",
				params = {
					[1.0] = "0xA11B"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "stop",
								1 = "stop_release",
								2 = "stop_reverse_mvt"
							}
						}
					}
				}
			},
			state_programmable_safety_input_function_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058394,
				type = "string",
				params = {
					[1.0] = "0xA11A"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "active_closure",
								1 = "active_opening",
								3 = "any_mvt_forbidden",
								2 = "active_closure_admap"
							}
						}
					}
				}
			},
			state_recovered_state_after_power_cut_4504699139391490 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 29
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "off state",
								1 = "last operation state"
							}
						}
					}
				}
			},
			state_rel_current_mode_4504699140768002 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059666,
				type = "string",
				params = {
					[1.0] = "0xA612"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "not_set",
								1 = "not_set",
								2 = "not_set",
								5 = "not_set",
								3 = "set",
								4 = "not_set"
							}
						}
					}
				}
			},
			state_resistance_sensitivity_4504699139340802 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058390,
				type = "string",
				params = {
					[1.0] = "0xA116"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "very_low",
								1 = "low",
								3 = "high",
								2 = "normal"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4504699139129346 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 239,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4504699139129602 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 132,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4504699139194882 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 0
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4504699140047106 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 144,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4505798650757378 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 147,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4506898163302658 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 267,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4507997674012930 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 106,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4509097186557954 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 112,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4512395720523778 = {
				baseCommand = "getData",
				refreshAll = true,
				stateId = 49020928,
				type = "string",
				params = {
					[1.0] = "0x00"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							3,
							1,
							false
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Auto",
								1 = "Auto",
								3 = "Manual",
								2 = "Manual"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4512395721441282 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 220,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4513495232151554 = {
				baseCommand = "getData",
				refreshAll = true,
				stateId = 49020928,
				type = "string",
				params = {
					[1.0] = "0x00"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 3,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Auto",
								1 = "Auto",
								3 = "Manual",
								2 = "Manual"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4514594743779330 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 116,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4515694255407106 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 178,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_roll_end_limit_state_4531087419179010 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 0
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted_validated",
								2 = "Manual_validated",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto_validated"
							}
						}
					}
				}
			},
			state_running_time_up_4504699140243458 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059657,
				type = "int",
				params = {
					[1.0] = "0xA609"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 138
						}
					}
				}
			},
			state_safety_edge_activation_4512395720866306 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058392,
				type = "string",
				params = {
					[1.0] = "0xA118"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "inactive",
								1 = "active",
								2 = "active_autotest"
							}
						}
					}
				}
			},
			state_safety_edge_activation_4516793767377410 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058392,
				type = "string",
				params = {
					[1.0] = "0xA118"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "active",
								1 = "active_autotested"
							}
						}
					}
				}
			},
			state_safety_edge_technology_4517893278874114 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058627,
				type = "string",
				params = {
					[1.0] = "0xA203"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								3 = "wired_ese_1k2",
								1 = "wired_ose",
								2 = "wired_ese_8k2"
							}
						}
					}
				}
			},
			state_security_level_4521191813545986 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 19
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "links_not_locked",
								1 = "normal",
								2 = "over_tcs"
							}
						}
					}
				}
			},
			state_setting_state_4504699139129346 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 246,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Setting in progress",
								2 = "Set",
								3 = "User mode",
								4 = "Re-setting in progress"
							}
						}
					}
				}
			},
			state_setting_state_4504699139129602 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 95,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Setting in progress",
								2 = "Set",
								3 = "User mode",
								4 = "Re-setting in progress"
							}
						}
					}
				}
			},
			state_setting_state_4504699139194882 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 2
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Setting in progress",
								2 = "Set",
								3 = "User mode",
								4 = "Re-setting in progress"
							}
						}
					}
				}
			},
			state_setting_state_4504699139340802 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = true,
				stateId = 84058662,
				type = "string",
				params = {
					[1.0] = "0xA226"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Set"
							}
						}
					}
				}
			},
			state_setting_state_4504699140047106 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 127,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Setting in progress",
								2 = "Set",
								3 = "User mode",
								4 = "Re-setting in progress"
							}
						}
					}
				}
			},
			state_setting_state_4505798650757378 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 30,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Setting in progress",
								2 = "Set",
								3 = "User mode",
								4 = "Re-setting in progress"
							}
						}
					}
				}
			},
			state_setting_state_4506898163302658 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 274,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Setting in progress",
								2 = "Set",
								3 = "User mode",
								4 = "Re-setting in progress"
							}
						}
					}
				}
			},
			state_setting_state_4507997674012930 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 88,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Setting in progress",
								2 = "Set",
								3 = "User mode",
								4 = "Re-setting in progress"
							}
						}
					}
				}
			},
			state_setting_state_4509097185640450 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 73,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Setting in progress",
								2 = "Set",
								3 = "User mode",
								4 = "Re-setting in progress"
							}
						}
					}
				}
			},
			state_setting_state_4511296208896002 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 34,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Setting in progress",
								2 = "Set",
								3 = "User mode",
								4 = "Re-setting in progress"
							}
						}
					}
				}
			},
			state_setting_state_4512395720523778 = {
				baseCommand = "getData",
				refreshAll = true,
				stateId = 49020928,
				type = "string",
				params = {
					[1.0] = "0x00"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							2,
							1,
							true
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Set",
								2 = "User mode"
							}
						}
					}
				}
			},
			state_setting_state_4512395721441282 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 227,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Setting in progress",
								2 = "Set",
								3 = "User mode",
								4 = "Re-setting in progress"
							}
						}
					}
				}
			},
			state_setting_state_4513495232151554 = {
				baseCommand = "getData",
				refreshAll = true,
				stateId = 49020928,
				type = "string",
				params = {
					[1.0] = "0x00"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 2,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Set",
								2 = "User mode"
							}
						}
					}
				}
			},
			state_setting_state_4514594743779330 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 100,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Setting in progress",
								2 = "Set",
								3 = "User mode",
								4 = "Re-setting in progress"
							}
						}
					}
				}
			},
			state_setting_state_4515694255407106 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 90,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not set",
								1 = "Setting in progress",
								2 = "Set",
								3 = "User mode",
								4 = "Re-setting in progress"
							}
						}
					}
				}
			},
			state_settings_lock_status_4504699139340802 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058409,
				type = "string",
				params = {
					[1.0] = "0xA129"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "unlocked",
								1 = "locked"
							}
						}
					}
				}
			},
			state_smart_protect_4521191813545986 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 137
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "disable",
								1 = "enable"
							}
						}
					}
				}
			},
			state_soft_start_4521191813545986 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "int",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 21
						}
					}
				}
			},
			state_soft_stop_4521191813545986 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "int",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 22
						}
					}
				}
			},
			state_start_delay_4504699140243458 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059659,
				type = "int",
				params = {
					[1.0] = "0xA60B"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 133
						}
					}
				}
			},
			state_tilting_time_4504699140243458 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059659,
				type = "int",
				params = {
					[1.0] = "0xA60B"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 132
						}
					}
				}
			},
			state_timeout_timer_4504699139981826 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 135
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "disable",
								1 = "enable"
							}
						}
					}
				}
			},
			state_timeout_timer_value_4504699139981826 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "int",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 136
						}
					}
				}
			},
			state_type_lock_4504699139194882 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 139
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "no_locks",
								1 = "auto_locks",
								2 = "manual_locks"
							}
						}
					}
				}
			},
			state_uel_current_mode_4504699140768002 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059666,
				type = "string",
				params = {
					[1.0] = "0xA612"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 0
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "not_set",
								1 = "not_set",
								2 = "not_set",
								5 = "not_set",
								3 = "set",
								4 = "not_set"
							}
						}
					}
				}
			},
			state_uel_current_mode_4505798652395778 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059666,
				type = "string",
				params = {
					[1.0] = "0xA612"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 0
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "not_set",
								1 = "not_set",
								2 = "not_set",
								5 = "not_set",
								3 = "not_set",
								4 = "set"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4504699139129346 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 241,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4504699139129602 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 131,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4504699139194882 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4504699140047106 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 143,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4505798650757378 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 146,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4506898163302658 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 269,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4507997674012930 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 105,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4509097186557954 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 111,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4512395720523778 = {
				baseCommand = "getData",
				refreshAll = true,
				stateId = 49020928,
				type = "string",
				params = {
					[1.0] = "0x00"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							3,
							1,
							"true"
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Auto",
								1 = "Manual",
								3 = "Manual",
								2 = "Auto"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4512395721441282 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 222,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4513495232151554 = {
				baseCommand = "getData",
				refreshAll = true,
				stateId = 49020928,
				type = "string",
				params = {
					[1.0] = "0x00"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 3,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Auto",
								1 = "Manual",
								3 = "Manual",
								2 = "Auto"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4514594743779330 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 115,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4515694255407106 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84082687,
				type = "string",
				params = {
					[1.0] = "0xFFFF"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 179,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted",
								2 = "Manual",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto"
							}
						}
					}
				}
			},
			state_unroll_end_limit_state_4531087419179010 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "Not_set",
								1 = "Manual",
								6 = "Assisted_validated",
								2 = "Manual_validated",
								5 = "Assisted",
								3 = "Auto",
								4 = "Auto_validated"
							}
						}
					}
				}
			},
			state_unstressing_duration_4504699139194882 = {
				baseCommand = "readPrivate",
				refreshAll = true,
				stateId = 48170496,
				type = "int",
				params = {
					{
						"0x02",
						"0xDF",
						"0x06"
					}
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 4,
							[2.0] = 2
						}
					}
				}
			},
			state_unstressing_status_4504699139194882 = {
				baseCommand = "readPrivate",
				refreshAll = true,
				stateId = 48170496,
				type = "string",
				params = {
					{
						"0x02",
						"0xDF",
						"0x06"
					}
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 3,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "disable",
								1 = "enable"
							}
						}
					}
				}
			},
			state_unstressing_status_4535485464772610 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059659,
				type = "string",
				params = {
					[1.0] = "0xA60B"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 0
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "disable",
								1 = "enable"
							}
						}
					}
				}
			},
			state_ventilation_lock_4504699140768002 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 32
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "disable",
								1 = "enable"
							}
						}
					}
				}
			},
			state_wired_control_4504699139471874 = {
				baseCommand = "readObjectWithPrepareData",
				refreshAll = false,
				stateId = 84058396,
				type = "string",
				params = {
					[1.0] = "0xA11C"
				},
				conversions = {
					{
						function = "readInt",
						params = {
							[1.0] = 0,
							[2.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "total_partial_mode",
								1 = "open_close_mode"
							}
						}
					}
				}
			},
			state_wired_input_type_4504699139391490 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 141
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "single momentary switch",
								1 = "fixed switch",
								2 = "double momentary switch"
							}
						}
					}
				}
			},
			state_x_time_4504699139194882 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059664,
				type = "string",
				params = {
					[1.0] = "0xA610"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 132
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "level_0",
								1 = "level_1",
								255 = "not_auto",
								2 = "level_2"
							}
						}
					}
				}
			},
			state_x_time_4507997674930178 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 138
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "level_0",
								1 = "level_1",
								255 = "not_auto",
								2 = "level_2"
							}
						}
					}
				}
			},
			state_x_time_4531087419179010 = {
				baseCommand = "readObject",
				refreshAll = true,
				stateId = 84059651,
				type = "string",
				params = {
					[1.0] = "0xA603"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 138
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "enable",
								255 = "disable"
							}
						}
					}
				}
			}
		})["state_current_position_4504699139129346"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4504699139129346"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4504699139129346"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139129346"],
		setting_state = ()["state_setting_state_4504699139129346"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139129346"]
	},
	states_4504699139129602 = {
		current_position = ()["state_current_position_4504699139129346"],
		current_tilt = ()["state_current_tilt_4504699139129602"],
		evb_tilting_travel = ()["state_evb_tilting_travel_4504699139129602"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4504699139129602"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4504699139129602"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139129602"],
		setting_state = ()["state_setting_state_4504699139129602"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139129602"]
	},
	states_4504699139194882 = {
		current_position = ()["state_current_position_4504699139129346"],
		curtain_outstretching_level = ()["state_curtain_outstretching_level_4504699139194882"],
		obstacle_detection = ()["state_obstacle_detection_4504699139194882"],
		oem_x_time = ()["state_x_time_4504699139194882"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		setting_state = ()["state_setting_state_4504699139194882"],
		type_lock = ()["state_type_lock_4504699139194882"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"],
		unstressing_duration = ()["state_unstressing_duration_4504699139194882"],
		unstressing_status = ()["state_unstressing_status_4504699139194882"],
		x_time = ()["state_x_time_4504699139194882"]
	},
	states_4504699139340802 = {
		autolearning_state = ()["state_autolearning_state_4504699139340802"],
		cells_activation = ()["state_cells_activation_4504699139340802"],
		close_tempo_total_mode = ()["state_close_tempo_total_mode_4504699139340802"],
		cruising_speed_type_closing = ()["state_cruising_speed_type_closing_4504699139340802"],
		cruising_speed_type_opening = ()["state_cruising_speed_type_opening_4504699139340802"],
		current_position = ()["state_current_position_4504699139129346"],
		detailed_actuator_type = ()["state_detailed_actuator_type_4504699139340802"],
		docking_area_speed_closing = ()["state_docking_area_speed_closing_4504699139340802"],
		docking_area_type_in_closing = ()["state_docking_area_type_in_closing_4504699139340802"],
		docking_area_type_in_opening = ()["state_docking_area_type_in_opening_4504699139340802"],
		mode_user_total = ()["state_mode_user_total_4504699139340802"],
		photocells_input_status = ()["state_photocells_input_status_4504699139340802"],
		resistance_sensitivity = ()["state_resistance_sensitivity_4504699139340802"],
		setting_state = ()["state_setting_state_4504699139340802"],
		settings_lock_status = ()["state_settings_lock_status_4504699139340802"]
	},
	states_4504699139391490 = {
		current_position = ()["state_current_position_4504699139129346"],
		load_AC_drive_request = ()["state_load_AC_drive_request_4504699139391490"],
		recovered_state_after_power_cut = ()["state_recovered_state_after_power_cut_4504699139391490"],
		wired_input_type = ()["state_wired_input_type_4504699139391490"]
	},
	states_4504699139471874 = {
		area_lighting_activation = ()["state_area_lighting_activation_4504699139471874"],
		area_lighting_tempo = ()["state_area_lighting_tempo_4504699139471874"],
		autolearning_state = ()["state_autolearning_state_4504699139471874"],
		auxiliary_control_activation = ()["state_auxiliary_control_activation_4504699139471874"],
		auxiliary_control_tempo = ()["state_auxiliary_control_tempo_4504699139471874"],
		cells_activation = ()["state_cells_activation_4504699139340802"],
		close_long_tempo_partial_mode = ()["state_close_long_tempo_partial_mode_4504699139471874"],
		close_short_tempo_partial_mode = ()["state_close_short_tempo_partial_mode_4504699139471874"],
		close_tempo_total_mode = ()["state_close_tempo_total_mode_4504699139471874"],
		cruising_speed_type_closing = ()["state_cruising_speed_type_closing_4504699139471874"],
		cruising_speed_type_opening = ()["state_cruising_speed_type_opening_4504699139471874"],
		current_position = ()["state_current_position_4504699139129346"],
		docking_area_speed_closing = ()["state_docking_area_speed_closing_4504699139471874"],
		docking_area_speed_opening = ()["state_docking_area_speed_opening_4504699139471874"],
		docking_area_type_in_closing = ()["state_docking_area_type_in_closing_4504699139471874"],
		docking_area_type_in_opening = ()["state_docking_area_type_in_opening_4504699139471874"],
		lock_output = ()["state_lock_output_4504699139471874"],
		lock_release = ()["state_lock_release_4504699139471874"],
		mode_user_partial = ()["state_mode_user_partial_4504699139471874"],
		mode_user_total = ()["state_mode_user_total_4504699139340802"],
		motor1_closing_slowdown_torque_limitation = ()["state_motor1_closing_slowdown_torque_limitation_4504699139471874"],
		motor1_closing_torque_limitation = ()["state_motor1_closing_torque_limitation_4504699139471874"],
		motor1_opening_slowdown_torque_limitation = ()["state_motor1_opening_slowdown_torque_limitation_4504699139471874"],
		motor1_opening_torque_limitation = ()["state_motor1_opening_torque_limitation_4504699139471874"],
		motor2_closing_slowdown_torque_limitation = ()["state_motor2_closing_slowdown_torque_limitation_4504699139471874"],
		motor2_closing_torque_limitation = ()["state_motor2_closing_torque_limitation_4504699139471874"],
		motor2_opening_slowdown_torque_limitation = ()["state_motor2_opening_slowdown_torque_limitation_4504699139471874"],
		motor2_opening_torque_limitation = ()["state_motor2_opening_torque_limitation_4504699139471874"],
		motor_shift_in_closing = ()["state_motor_shift_in_closing_4504699139471874"],
		motor_shift_in_opening = ()["state_motor_shift_in_opening_4504699139471874"],
		orange_light_prelighting = ()["state_orange_light_prelighting_4504699139471874"],
		programmable_safety_input = ()["state_programmable_safety_input_4504699139471874"],
		programmable_safety_input_action = ()["state_programmable_safety_input_action_4504699139471874"],
		programmable_safety_input_function = ()["state_programmable_safety_input_function_4504699139471874"],
		setting_state = ()["state_setting_state_4504699139340802"],
		settings_lock_status = ()["state_settings_lock_status_4504699139340802"],
		wired_control = ()["state_wired_control_4504699139471874"]
	},
	states_4504699139653634 = {
		current_position = ()["state_current_position_4504699139129346"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4504699139653634"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4504699139653634"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		setting_state = ()["state_setting_state_4504699139194882"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"]
	},
	states_4504699139981826 = {
		current_position = ()["state_current_position_4504699139129346"],
		recovered_state_after_power_cut = ()["state_recovered_state_after_power_cut_4504699139391490"],
		timeout_timer = ()["state_timeout_timer_4504699139981826"],
		timeout_timer_value = ()["state_timeout_timer_value_4504699139981826"],
		wired_input_type = ()["state_wired_input_type_4504699139391490"]
	},
	states_4504699140047106 = {
		current_position = ()["state_current_position_4504699139129346"],
		dbe_up = ()["state_dbe_up_4504699140047106"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699140047106"],
		setting_state = ()["state_setting_state_4504699140047106"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699140047106"],
		unstressing_duration = ()["state_unstressing_duration_4504699139194882"],
		unstressing_status = ()["state_unstressing_status_4504699139194882"]
	},
	states_4504699140112386 = {
		current_position = ()["state_current_position_4504699139129346"],
		evb_tilting_travel = ()["state_evb_tilting_travel_4504699139129602"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4504699139653634"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4504699139653634"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		setting_state = ()["state_setting_state_4504699139194882"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"]
	},
	states_4504699140243458 = {
		application = ()["state_application_4504699140243458"],
		current_position = ()["state_current_position_4504699139129346"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4504699139653634"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4504699139653634"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		running_time_up = ()["state_running_time_up_4504699140243458"],
		setting_state = ()["state_setting_state_4504699139194882"],
		start_delay = ()["state_start_delay_4504699140243458"],
		tilting_time = ()["state_tilting_time_4504699140243458"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"]
	},
	states_4504699140389378 = {
		current_position = ()["state_current_position_4504699139129346"],
		setting_state = ()["state_setting_state_4504699139194882"],
		timeout_timer = ()["state_timeout_timer_4504699139981826"],
		timeout_timer_value = ()["state_timeout_timer_value_4504699139981826"]
	},
	states_4504699140768002 = {
		application = ()["state_application_4504699140768002"],
		current_position = ()["state_current_position_4504699139129346"],
		rel_current_mode = ()["state_rel_current_mode_4504699140768002"],
		setting_state = ()["state_setting_state_4504699139194882"],
		timeout_timer = ()["state_timeout_timer_4504699139981826"],
		timeout_timer_value = ()["state_timeout_timer_value_4504699139981826"],
		uel_current_mode = ()["state_uel_current_mode_4504699140768002"],
		ventilation_lock = ()["state_ventilation_lock_4504699140768002"]
	},
	states_4505798650757378 = {
		current_position = ()["state_current_position_4504699139129346"],
		current_tilt = ()["state_current_tilt_4504699139129602"],
		evb_tilting_travel = ()["state_evb_tilting_travel_4504699139129602"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4505798650757378"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4505798650757378"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4505798650757378"],
		setting_state = ()["state_setting_state_4505798650757378"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4505798650757378"]
	},
	states_4505798651034114 = {
		current_position = ()["state_current_position_4504699139129346"],
		setting_state = ()["state_setting_state_4504699139194882"]
	},
	states_4505798651674882 = {
		current_position = ()["state_current_position_4504699139129346"],
		dbe_up = ()["state_dbe_up_4504699140047106"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699140047106"],
		setting_state = ()["state_setting_state_4504699140047106"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699140047106"]
	},
	states_4505798652395778 = {
		application = ()["state_application_4504699140768002"],
		current_position = ()["state_current_position_4504699139129346"],
		eld_level = ()["state_eld_level_4505798652395778"],
		rel_current_mode = ()["state_rel_current_mode_4504699140768002"],
		setting_state = ()["state_setting_state_4504699139194882"],
		timeout_timer = ()["state_timeout_timer_4504699139981826"],
		timeout_timer_value = ()["state_timeout_timer_value_4504699139981826"],
		uel_current_mode = ()["state_uel_current_mode_4505798652395778"],
		ventilation_lock = ()["state_ventilation_lock_4504699140768002"]
	},
	states_4506898163302402 = {
		current_position = ()["state_current_position_4504699139129346"],
		dbe_up = ()["state_dbe_up_4504699140047106"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		setting_state = ()["state_setting_state_4504699139194882"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"],
		unstressing_duration = ()["state_unstressing_duration_4504699139194882"],
		unstressing_status = ()["state_unstressing_status_4504699139194882"]
	},
	states_4506898163302658 = {
		current_position = ()["state_current_position_4504699139129346"],
		dbe_up = ()["state_dbe_up_4504699140047106"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4506898163302658"],
		setting_state = ()["state_setting_state_4506898163302658"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4506898163302658"]
	},
	states_4507997674012930 = {
		current_position = ()["state_current_position_4504699139129346"],
		current_tilt = ()["state_current_tilt_4504699139129602"],
		evb_tilting_travel = ()["state_evb_tilting_travel_4504699139129602"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4507997674012930"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4507997674012930"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4507997674012930"],
		setting_state = ()["state_setting_state_4507997674012930"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4507997674012930"]
	},
	states_4507997674930178 = {
		application = ()["state_application_4507997674930178"],
		current_position = ()["state_current_position_4504699139129346"],
		dbe_up = ()["state_dbe_up_4504699140047106"],
		oem_x_time = ()["state_x_time_4504699139194882"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		setting_state = ()["state_setting_state_4504699139194882"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"],
		unstressing_duration = ()["state_unstressing_duration_4504699139194882"],
		unstressing_status = ()["state_unstressing_status_4504699139194882"],
		x_time = ()["state_x_time_4507997674930178"]
	},
	states_4509097185640450 = {
		current_position = ()["state_current_position_4504699139129346"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4509097185640450"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4509097185640450"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		setting_state = ()["state_setting_state_4509097185640450"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"]
	},
	states_4509097186557954 = {
		current_position = ()["state_current_position_4504699139129346"],
		dbe_up = ()["state_dbe_up_4504699140047106"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4509097186557954"],
		setting_state = ()["state_setting_state_4504699139129602"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4509097186557954"],
		unstressing_duration = ()["state_unstressing_duration_4504699139194882"],
		unstressing_status = ()["state_unstressing_status_4504699139194882"]
	},
	states_4509097186623490 = {
		current_position = ()["state_current_position_4504699139129346"],
		current_tilt = ()["state_current_tilt_4504699139129602"],
		evb_tilting_travel = ()["state_evb_tilting_travel_4504699139129602"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4504699139653634"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4504699139653634"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		setting_state = ()["state_setting_state_4504699139194882"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"]
	},
	states_4511296208896002 = {
		current_position = ()["state_current_position_4504699139129346"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4511296208896002"],
		paired_1w_sensors = ()["state_paired_1w_controllers_4504699139129602"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		setting_state = ()["state_setting_state_4511296208896002"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"]
	},
	states_4512395720523778 = {
		current_position = ()["state_current_position_4504699139129346"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4512395720523778"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4512395720523778"],
		setting_state = ()["state_setting_state_4512395720523778"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4512395720523778"]
	},
	states_4512395720866306 = {
		area_lighting_activation = ()["state_area_lighting_activation_4504699139471874"],
		area_lighting_tempo = ()["state_area_lighting_tempo_4504699139471874"],
		autolearning_state = ()["state_autolearning_state_4504699139471874"],
		auxiliary_control_activation = ()["state_auxiliary_control_activation_4504699139471874"],
		auxiliary_control_tempo = ()["state_auxiliary_control_tempo_4504699139471874"],
		cells_activation = ()["state_cells_activation_4504699139340802"],
		close_long_tempo_partial_mode = ()["state_close_long_tempo_partial_mode_4504699139471874"],
		close_short_tempo_partial_mode = ()["state_close_short_tempo_partial_mode_4504699139471874"],
		close_tempo_total_mode = ()["state_close_tempo_total_mode_4504699139471874"],
		cruising_speed_type_closing = ()["state_cruising_speed_type_closing_4504699139471874"],
		cruising_speed_type_opening = ()["state_cruising_speed_type_opening_4504699139471874"],
		current_position = ()["state_current_position_4504699139129346"],
		docking_area_speed_closing = ()["state_docking_area_speed_closing_4504699139471874"],
		docking_area_speed_opening = ()["state_docking_area_speed_opening_4504699139471874"],
		docking_area_type_in_closing = ()["state_docking_area_type_in_closing_4504699139471874"],
		docking_area_type_in_opening = ()["state_docking_area_type_in_opening_4504699139471874"],
		mode_user_partial = ()["state_mode_user_partial_4504699139471874"],
		mode_user_total = ()["state_mode_user_total_4504699139340802"],
		motor1_closing_slowdown_torque_limitation = ()["state_motor1_closing_slowdown_torque_limitation_4504699139471874"],
		motor1_closing_torque_limitation = ()["state_motor1_closing_torque_limitation_4504699139471874"],
		motor1_opening_slowdown_torque_limitation = ()["state_motor1_opening_slowdown_torque_limitation_4504699139471874"],
		motor1_opening_torque_limitation = ()["state_motor1_opening_torque_limitation_4504699139471874"],
		orange_light_prelighting = ()["state_orange_light_prelighting_4504699139471874"],
		pop_value = ()["state_pop_value_4512395720866306"],
		programmable_safety_input = ()["state_programmable_safety_input_4504699139471874"],
		programmable_safety_input_action = ()["state_programmable_safety_input_action_4504699139471874"],
		programmable_safety_input_function = ()["state_programmable_safety_input_function_4504699139471874"],
		resistance_sensitivity = ()["state_resistance_sensitivity_4504699139340802"],
		safety_edge_activation = ()["state_safety_edge_activation_4512395720866306"],
		setting_state = ()["state_setting_state_4504699139340802"],
		settings_lock_status = ()["state_settings_lock_status_4504699139340802"],
		wired_control = ()["state_wired_control_4504699139471874"]
	},
	states_4512395721441282 = {
		current_position = ()["state_current_position_4504699139129346"],
		dbe_up = ()["state_dbe_up_4504699140047106"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4512395721441282"],
		setting_state = ()["state_setting_state_4512395721441282"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4512395721441282"],
		unstressing_duration = ()["state_unstressing_duration_4504699139194882"],
		unstressing_status = ()["state_unstressing_status_4504699139194882"]
	},
	states_4513495232151554 = {
		current_position = ()["state_current_position_4504699139129346"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4513495232151554"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4513495232151554"],
		setting_state = ()["state_setting_state_4513495232151554"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4513495232151554"]
	},
	states_4513495232217090 = {
		current_position = ()["state_current_position_4504699139129346"],
		dbe_down = ()["state_dbe_up_4504699140047106"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699140047106"],
		setting_state = ()["state_setting_state_4504699140047106"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699140047106"]
	},
	states_4513495233069058 = {
		current_position = ()["state_current_position_4504699139129346"],
		dbe_up = ()["state_dbe_up_4504699140047106"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139129346"],
		setting_state = ()["state_setting_state_4504699139129346"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139129346"],
		unstressing_duration = ()["state_unstressing_duration_4504699139194882"],
		unstressing_status = ()["state_unstressing_status_4504699139194882"]
	},
	states_4513495233134594 = {
		current_position = ()["state_current_position_4504699139129346"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4513495233134594"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4513495233134594"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		setting_state = ()["state_setting_state_4504699139194882"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"]
	},
	states_4514594743779330 = {
		current_position = ()["state_current_position_4504699139129346"],
		paired_1w_controllers = ()["state_paired_1w_sensors_4505798650757378"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4514594743779330"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4514594743779330"],
		setting_state = ()["state_setting_state_4514594743779330"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4514594743779330"]
	},
	states_4515694255407106 = {
		current_position = ()["state_current_position_4504699139129346"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4515694255407106"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4515694255407106"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4515694255407106"],
		setting_state = ()["state_setting_state_4515694255407106"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4515694255407106"]
	},
	states_4515694256324610 = {
		current_position = ()["state_current_position_4504699139129346"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4509097186557954"],
		setting_state = ()["state_setting_state_4504699139129602"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4509097186557954"]
	},
	states_4516793767377410 = {
		autolearning_state = ()["state_autolearning_state_4504699139340802"],
		cells_activation = ()["state_cells_activation_4504699139340802"],
		close_tempo_total_mode = ()["state_close_tempo_total_mode_4504699139340802"],
		cruising_speed_type_closing = ()["state_cruising_speed_type_closing_4504699139340802"],
		cruising_speed_type_opening = ()["state_cruising_speed_type_opening_4504699139340802"],
		current_position = ()["state_current_position_4504699139129346"],
		docking_area_speed_closing = ()["state_docking_area_speed_closing_4504699139340802"],
		docking_area_type_in_closing = ()["state_docking_area_type_in_closing_4504699139340802"],
		docking_area_type_in_opening = ()["state_docking_area_type_in_opening_4504699139340802"],
		mode_user_total = ()["state_mode_user_total_4504699139340802"],
		photocells_input_status = ()["state_photocells_input_status_4504699139340802"],
		resistance_sensitivity = ()["state_resistance_sensitivity_4504699139340802"],
		safety_edge_activation = ()["state_safety_edge_activation_4516793767377410"],
		setting_state = ()["state_setting_state_4504699139340802"],
		settings_lock_status = ()["state_settings_lock_status_4504699139340802"]
	},
	states_4517893278874114 = {
		autolearning_state = ()["state_autolearning_state_4504699139340802"],
		auxiliary_control_activation = ()["state_auxiliary_control_activation_4517893278874114"],
		cells_activation = ()["state_cells_activation_4504699139340802"],
		close_tempo_total_mode = ()["state_close_tempo_total_mode_4504699139340802"],
		current_position = ()["state_current_position_4504699139129346"],
		mode_user_total = ()["state_mode_user_total_4504699139340802"],
		photocells_input_status = ()["state_photocells_input_status_4504699139340802"],
		safety_edge_technology = ()["state_safety_edge_technology_4517893278874114"],
		setting_state = ()["state_setting_state_4504699139340802"],
		settings_lock_status = ()["state_settings_lock_status_4504699139340802"]
	},
	states_4517893279580162 = {
		current_position = ()["state_current_position_4504699139129346"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139129346"],
		setting_state = ()["state_setting_state_4504699139129346"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139129346"]
	},
	states_4521191813545986 = {
		current_position = ()["state_current_position_4504699139129346"],
		discreet_mode_speed = ()["state_discreet_mode_speed_4521191813545986"],
		nominal_mode_speed = ()["state_nominal_mode_speed_4521191813545986"],
		open_level = ()["state_open_level_4521191813545986"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		security_level = ()["state_security_level_4521191813545986"],
		setting_state = ()["state_setting_state_4504699139194882"],
		smart_protect = ()["state_smart_protect_4521191813545986"],
		soft_start = ()["state_soft_start_4521191813545986"],
		soft_stop = ()["state_soft_stop_4521191813545986"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"]
	},
	states_4522291326156802 = {
		current_position = ()["state_current_position_4504699139129346"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4522291326156802"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4522291326156802"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		setting_state = ()["state_setting_state_4504699139194882"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"]
	},
	states_4525589860057090 = {
		current_position = ()["state_current_position_4504699139129346"],
		discreet_mode_speed = ()["state_discreet_mode_speed_4521191813545986"],
		nominal_mode_speed = ()["state_nominal_mode_speed_4521191813545986"],
		open_level = ()["state_open_level_4521191813545986"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		security_level = ()["state_security_level_4521191813545986"],
		setting_state = ()["state_setting_state_4504699139194882"],
		soft_start = ()["state_soft_start_4521191813545986"],
		soft_stop = ()["state_soft_stop_4521191813545986"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"]
	},
	states_4526689372667906 = {
		current_position = ()["state_current_position_4504699139129346"],
		current_tilt = ()["state_current_tilt_4504699139129602"],
		evb_tilting_travel = ()["state_evb_tilting_travel_4504699139129602"],
		paired_1w_controllers = ()["state_paired_1w_controllers_4522291326156802"],
		paired_1w_sensors = ()["state_paired_1w_sensors_4522291326156802"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		setting_state = ()["state_setting_state_4504699139194882"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"]
	},
	states_4527788883655170 = {
		additional_thrust_in_closing = ()["state_additional_thrust_in_closing_4527788883655170"],
		area_lighting_activation = ()["state_area_lighting_activation_4504699139471874"],
		area_lighting_tempo = ()["state_area_lighting_tempo_4504699139471874"],
		autolearning_state = ()["state_autolearning_state_4504699139471874"],
		auxiliary_control_activation = ()["state_auxiliary_control_activation_4504699139471874"],
		auxiliary_control_tempo = ()["state_auxiliary_control_tempo_4504699139471874"],
		cells_activation = ()["state_cells_activation_4504699139340802"],
		close_long_tempo_partial_mode = ()["state_close_long_tempo_partial_mode_4504699139471874"],
		close_short_tempo_partial_mode = ()["state_close_short_tempo_partial_mode_4504699139471874"],
		close_tempo_total_mode = ()["state_close_tempo_total_mode_4504699139471874"],
		cruising_speed_type_closing = ()["state_cruising_speed_type_closing_4504699139471874"],
		cruising_speed_type_opening = ()["state_cruising_speed_type_opening_4504699139471874"],
		current_position = ()["state_current_position_4504699139129346"],
		docking_area_speed_closing = ()["state_docking_area_speed_closing_4504699139471874"],
		docking_area_speed_opening = ()["state_docking_area_speed_opening_4504699139471874"],
		docking_area_type_in_closing = ()["state_docking_area_type_in_closing_4504699139471874"],
		docking_area_type_in_opening = ()["state_docking_area_type_in_opening_4504699139471874"],
		lock_output = ()["state_lock_output_4504699139471874"],
		lock_release = ()["state_lock_release_4504699139471874"],
		mode_user_partial = ()["state_mode_user_partial_4504699139471874"],
		mode_user_total = ()["state_mode_user_total_4504699139340802"],
		motor1_closing_slowdown_torque_limitation = ()["state_motor1_closing_slowdown_torque_limitation_4504699139471874"],
		motor1_closing_torque_limitation = ()["state_motor1_closing_torque_limitation_4504699139471874"],
		motor1_opening_slowdown_torque_limitation = ()["state_motor1_opening_slowdown_torque_limitation_4504699139471874"],
		motor1_opening_torque_limitation = ()["state_motor1_opening_torque_limitation_4504699139471874"],
		motor2_closing_slowdown_torque_limitation = ()["state_motor2_closing_slowdown_torque_limitation_4504699139471874"],
		motor2_closing_torque_limitation = ()["state_motor2_closing_torque_limitation_4504699139471874"],
		motor2_opening_slowdown_torque_limitation = ()["state_motor2_opening_slowdown_torque_limitation_4504699139471874"],
		motor2_opening_torque_limitation = ()["state_motor2_opening_torque_limitation_4504699139471874"],
		motor_shift_in_closing = ()["state_motor_shift_in_closing_4504699139471874"],
		motor_shift_in_opening = ()["state_motor_shift_in_opening_4504699139471874"],
		orange_light_prelighting = ()["state_orange_light_prelighting_4504699139471874"],
		programmable_safety_input = ()["state_programmable_safety_input_4504699139471874"],
		programmable_safety_input_action = ()["state_programmable_safety_input_action_4504699139471874"],
		programmable_safety_input_function = ()["state_programmable_safety_input_function_4504699139471874"],
		setting_state = ()["state_setting_state_4504699139340802"],
		settings_lock_status = ()["state_settings_lock_status_4504699139340802"],
		wired_control = ()["state_wired_control_4504699139471874"]
	},
	states_4531087419179010 = {
		Prohibit_changes_of_Unroll_End_Limit = ()["state_Prohibit_changes_of_Unroll_End_Limit_4531087419179010"],
		automatic_adjustment_allowed = ()["state_automatic_adjustment_allowed_4531087419179010"],
		choregraphy_disable_variator_down_move_min = ()["state_choregraphy_disable_variator_down_move_min_4531087419179010"],
		choregraphy_disable_variator_up_move_min = ()["state_choregraphy_disable_variator_up_move_min_4531087419179010"],
		choregraphy_enable_variator_down_move_min = ()["state_choregraphy_enable_variator_down_move_min_4531087419179010"],
		choregraphy_enable_variator_up_move_min = ()["state_choregraphy_enable_variator_up_move_min_4531087419179010"],
		current_position = ()["state_current_position_4504699139129346"],
		current_tilt = ()["state_current_tilt_4504699139129602"],
		evb_tilting_travel_pulse = ()["state_evb_tilting_travel_pulse_4531087419179010"],
		kinematics = ()["state_kinematics_4531087419179010"],
		obstacle_detection = ()["state_obstacle_detection_4531087419179010"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4531087419179010"],
		setting_state = ()["state_setting_state_4504699139194882"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4531087419179010"],
		x_time = ()["state_x_time_4531087419179010"]
	},
	states_4535485464772610 = {
		application = ()["state_application_4507997674930178"],
		current_position = ()["state_current_position_4504699139129346"],
		dbe_up = ()["state_dbe_up_4504699140047106"],
		oem_x_time = ()["state_x_time_4504699139194882"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		setting_state = ()["state_setting_state_4504699139194882"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"],
		unstressing_status = ()["state_unstressing_status_4535485464772610"],
		x_time = ()["state_x_time_4507997674930178"]
	},
	states_4554177162379266 = {
		current_position = ()["state_current_position_4504699139129346"],
		discreet_mode_speed = ()["state_discreet_mode_speed_4521191813545986"],
		knx = ()["state_knx_4554177162379266"],
		nominal_mode_speed = ()["state_nominal_mode_speed_4521191813545986"],
		open_level = ()["state_open_level_4521191813545986"],
		roll_end_limit_state = ()["state_roll_end_limit_state_4504699139194882"],
		security_level = ()["state_security_level_4521191813545986"],
		setting_state = ()["state_setting_state_4504699139194882"],
		smart_protect = ()["state_smart_protect_4521191813545986"],
		soft_start = ()["state_soft_start_4521191813545986"],
		soft_stop = ()["state_soft_stop_4521191813545986"],
		unroll_end_limit_state = ()["state_unroll_end_limit_state_4504699139194882"]
	},
	diagnosticStatesGroups_4504699139653634 = {},
	diagnosticStatesGroups_4584963487956994 = {
		BatteryCompliance = ({
			diagnosticState_BatteryComplianceGroups_4584963487956994 = {
				baseCommand = "readObject",
				refreshAll = false,
				stateId = 84059649,
				type = "string",
				params = {
					[1.0] = "0xA601"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 3
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "compliant",
								1 = "undersizes",
								2 = "oversized"
							}
						}
					}
				}
			},
			diagnosticState_BatteryStatusGroups_4584963487956994 = {
				baseCommand = "readObject",
				refreshAll = false,
				stateId = 84059649,
				type = "string",
				params = {
					[1.0] = "0xA601"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 1
						}
					},
					{
						function = "simpleMatching",
						params = {
							{
								0 = "battery_level_very_low",
								1 = "battery_level_low",
								2 = "battery_level_mid",
								3 = "battery_level_high",
								4 = "battery_level_unknown"
							}
						}
					}
				}
			},
			diagnosticState_Last_Battery_VoltageGroups_4584963487956994 = {
				baseCommand = "readObject",
				refreshAll = false,
				stateId = 84059649,
				type = "int",
				params = {
					[1.0] = "0xA601"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 146
						}
					}
				}
			},
			diagnosticState_Last_Solar_Panel_EnergyGroups_4584963487956994 = {
				baseCommand = "readObject",
				refreshAll = false,
				stateId = 84059649,
				type = "int",
				params = {
					[1.0] = "0xA601"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 148
						}
					}
				}
			},
			diagnosticState_Last_Solar_Panel_VoltageGroups_4584963487956994 = {
				baseCommand = "readObject",
				refreshAll = false,
				stateId = 84059649,
				type = "int",
				params = {
					[1.0] = "0xA601"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 147
						}
					}
				}
			},
			diagnosticState_Nominal_torqueGroups_4584963487956994 = {
				baseCommand = "readObject",
				refreshAll = false,
				stateId = 84059668,
				type = "int",
				params = {
					[1.0] = "0xA614"
				},
				conversions = {
					{
						function = "readSOFOPU",
						params = {
							[1.0] = 137
						}
					}
				}
			},
			diagnosticState_OEM_Battery_NameGroups_4584963487956994 = {
				baseCommand = "readObject",
				refreshAll = false,
				stateId = 84059669,
				type = "string",
				params = {
					[1.0] = "0xA615"
				},
				conversions = {
					{
						function = "readSOFOPUString",
						params = {
							[1.0] = 140
						}
					}
				}
			},
			diagnosticState_OEM_Battery_ReferenceGroups_4584963487956994 = {
				baseCommand = "readObject",
				refreshAll = false,
				stateId = 84059669,
				type = "string",
				params = {
					[1.0] = "0xA615"
				},
				conversions = {
					{
						function = "readSOFOPUString",
						params = {
							[1.0] = 139
						}
					}
				}
			},
			diagnosticState_OEM_SolarPanel_NameGroups_4584963487956994 = {
				baseCommand = "readObject",
				refreshAll = false,
				stateId = 84059669,
				type = "string",
				params = {
					[1.0] = "0xA615"
				},
				conversions = {
					{
						function = "readSOFOPUString",
						params = {
							[1.0] = 142
						}
					}
				}
			},
			diagnosticState_OEM_SolarPanel_ReferenceGroups_4584963487956994 = {
				baseCommand = "readObject",
				refreshAll = false,
				stateId = 84059669,
				type = "string",
				params = {
					[1.0] = "0xA615"
				},
				conversions = {
					{
						function = "readSOFOPUString",
						params = {
							[1.0] = 141
						}
					}
				}
			}
		})["diagnosticState_BatteryComplianceGroups_4584963487956994"],
		BatteryStatus = ()["diagnosticState_BatteryStatusGroups_4584963487956994"],
		Last_Battery_Voltage = ()["diagnosticState_Last_Battery_VoltageGroups_4584963487956994"],
		Last_Solar_Panel_Energy = ()["diagnosticState_Last_Solar_Panel_EnergyGroups_4584963487956994"],
		Last_Solar_Panel_Voltage = ()["diagnosticState_Last_Solar_Panel_VoltageGroups_4584963487956994"],
		Nominal_torque = ()["diagnosticState_Nominal_torqueGroups_4584963487956994"],
		OEM_Battery_Name = ()["diagnosticState_OEM_Battery_NameGroups_4584963487956994"],
		OEM_Battery_Reference = ()["diagnosticState_OEM_Battery_ReferenceGroups_4584963487956994"],
		OEM_SolarPanel_Name = ()["diagnosticState_OEM_SolarPanel_NameGroups_4584963487956994"],
		OEM_SolarPanel_Reference = ()["diagnosticState_OEM_SolarPanel_ReferenceGroups_4584963487956994"]
	}
}
