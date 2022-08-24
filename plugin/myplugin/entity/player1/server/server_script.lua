Trigger.addHandler(this:cfg(), "PRE_CHECK_PICK_ITEM", function(context)
    local player = context.obj1
    PackageHandlers.sendServerHandler(player, "PickItemHander", {txt = 'Pick up items'})   --Send agreement
end) 