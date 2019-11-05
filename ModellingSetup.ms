try(destroyDialog MainRollout)catch()

fn ToPivot obj =
(
	obj.pivot = [obj.pos.x,obj.pos.y,obj.max.z]
	convertTo obj PolyMeshObject
)

--Called Menus
--Ref
rollout PlaneProp "Reference Properties" width: 200 height: 78
(
	spinner cLength "Length" range:[0,100,10] type: #worldunits pos:[40,8]
	on cLength changed val do
	(
		$.length = val
	)
	
	spinner cWidth "Width" range:[0,100,10] type: #worldunits pos:[45,28]
	on cWidth changed val do
	(
		$.width = val
	)
	
	button btnAccept "Accept"
	on btnAccept pressed do
	(	
		$.pos = [0,0,$.max.z]
		destroyDialog PlaneProp		
	)
)

--Parts
rollout BodyProp "Body Properties" width: 200 height:100
(
	spinner cBodyRadius "Radius" range:[0,100,1] type: #worldunits 
	on cBodyRadius changed val do
	(
		$Body.radius = val
	)
	
	spinner cBodyHeight "Height" range:[0,100,3] type: #worldunits 
	on cBodyHeight changed val do
	(
		$Body.height = val
	)
	
	spinner cBodySides "Sides" range:[8,16,12] type:#integer	
	on cBodySides changed val do
	(
		$Body.sides = val
	)
	
	button btnAccept "Accept"
	on btnAccept pressed do
	(	
		convertTo $ PolyMeshObject
		destroyDialog BodyProp		
	)
)

rollout HeadProp "Head Properties" width:200 height:100
(
	spinner cHeadLength "Length" range:[0,100,1.5] type: #worldunits
	on cHeadLength changed val do
	(
		$Head.length = val
	)
	
	spinner cHeadWidth "Width" range:[0,100,1.5] type: #worldunits 
	on cHeadWidth changed val do
	(
		$Head.width= val
	)
	
	spinner cHeadHeight "Height" range:[0,100,1.5] type: #worldunits
	on cHeadHeight changed val do
	(
		$Head.height= val
	)
	
	button btnAccept "Accept"
	on btnAccept pressed do
	(	
		convertTo $ PolyMeshObject
		modPanel.addModToSelection (Spherify ()) ui:on
		maxOps.CollapseNode $ off
		destroyDialog HeadProp	
	)
	
)

rollout LimbProp "Limbs Properties" width:200 height:100
(
	spinner cLimbRadius "Radius" range:[0,100,0.5] type: #worldunits 
	on cLimbRadius changed val do
	(
		$.radius = val
	)
	
	spinner cLimbHeight "Height" range:[0,100,2.5] type: #worldunits 
	on cLimbHeight changed val do
	(
		$.height = val
	)
	
	spinner cLimbSides "Sides" range:[4,8,8] type:#integer	
	on cLimbSides changed val do
	(
		$.sides = val
	)
	
	button btnAccept "Accept"
	on btnAccept pressed do
	(	
		ToPivot $
		destroyDialog LimbProp		
	)
)

rollout LimbProp2 "Limbs Properties" width:200 height:100
(
	spinner cLimbLength "Length" range:[0,100,0.5] type: #worldunits
	on cLimbLength changed val do
	(
		$.length = val
	)
	
	spinner cLimbWidth "Width" range:[0,100,0.5] type: #worldunits 
	on cLimbWidth changed val do
	(
		$.width= val
	)
	
	spinner cLimbHeight "Height" range:[0,100,0.5] type: #worldunits
	on cLimbHeight changed val do
	(
		$.height= val
	)
	
	button btnAccept "Accept"
	on btnAccept pressed do
	(	
		ToPivot $
		destroyDialog LimbProp2		
	)
)

--All
rollout AllProp "Create All Body Parts" width:200 height:570
(
	GroupBox 'headPos' "Head" width:175 height:90 align:#left
	spinner cHeadLength "Length" range:[0,100,1.5] type: #worldunits pos:[40,25]
	on cHeadLength changed val do
	(
		$Head.length = val
	)
	
	spinner cHeadWidth "Width" range:[0,100,1.5] type: #worldunits pos:[45,46]
	on cHeadWidth changed val do
	(
		$Head.width= val
	)
	
	spinner cHeadHeight "Height" range:[0,100,1.5] type: #worldunits pos:[42,67]
	on cHeadHeight changed val do
	(
		$Head.height= val
	)
	
	GroupBox 'bodyPos' "Body" width:175 height:90 align:#left pos:[13,100]
	spinner cBodyRadius "Radius" range:[0,100,1] type: #worldunits pos:[40,120]
	on cBodyRadius changed val do
	(
		$Body.radius = val
	)
	
	spinner cBodyHeight "Height" range:[0,100,3] type: #worldunits pos:[42,141]
	on cBodyHeight changed val do
	(
		$Body.height = val
	)
	
	spinner cBodySides "Sides" range:[8,16,12] type:#integer pos:[48,162]
	on cBodySides changed val do
	(
		$Body.sides = val
	)
	
	GroupBox 'limbsPos' "Limbs" width:175 height:160 align:#left  pos:[13,195]
	spinner cArmHeight "Arm Height" range:[0,100,2.5] type: #worldunits pos:[30,215]
	on cArmHeight changed val do
	(
		$Arm.height = val
	)
	
	spinner cArmRadius "Arm Radius" range:[0,100,0.5] type: #worldunits pos:[30,236]
	on cArmRadius changed val do
	(
		$Arm.radius = val
	)
	
	spinner cArmSides "Arm Sides" range:[4,8,8] type:#integer pos:[36,257]
	
	on cArmSides changed val do
	(
		$Arm.sides = val
	)
	
	spinner cLegHeight "Leg Height" range:[0,100,2.5] type: #worldunits pos:[32,285]
	on cLegHeight changed val do
	(
		$Leg.height = val
	)
	
	spinner cLegRadius "Leg Radius" range:[0,100,0.5] type: #worldunits pos:[32,306]
	on cLegRadius changed val do
	(
		$Leg.radius = val
	)
	
	spinner cLegSides "Leg Sides" range:[4,8,8] type:#integer	pos:[38,327]
	on cLegSides changed val do
	(
		$Leg.sides = val
	)
	
	GroupBox 'handFeetPos' "Hands and Feet" width:175 height:160 align:#left  pos:[13,360]
	spinner cHandLength "Hand Length" range:[0,100,0.5] type: #worldunits pos:[28,380]
	on cHandLength changed val do
	(
		$Hand.length = val
	)
	
	spinner cHandWidth "Hand Width" range:[0,100,0.5] type: #worldunits pos:[33,401]
	on cHandWidth changed val do
	(
		$Hand.width= val
	)
	
	spinner cHandHeight "Hand Height" range:[0,100,0.5] type: #worldunits pos:[30,422]
	on cHandHeight changed val do
	(
		$Hand.height= val
	)
	
	spinner cFootLength "Foot Length" range:[0,100,0.5] type: #worldunits pos:[28,450]
	on cFootLength changed val do
	(
		$Foot.length = val
	)
	
	spinner cFootWidth "Foot Width" range:[0,100,0.5] type: #worldunits pos:[33,471]
	on cFootWidth changed val do
	(
		$Foot.width= val
	)
	
	spinner cFootHeight "Foot Height" range:[0,100,0.5] type: #worldunits pos:[30,492]
	on cFootHeight changed val do
	(
		$Foot.height= val
	)
	
	button btnAccept "Accept" pos:[76,528]
	on btnAccept pressed do
	(	
		select $Head
		convertTo $ PolyMeshObject
		modPanel.addModToSelection (Spherify ()) ui:on
		maxOps.CollapseNode $ off
		
		convertTo $Body PolyMeshObject
		
		ToPivot $Arm
		ToPivot $Leg
		ToPivot $Hand
		ToPivot $Foot
			
		destroyDialog AllProp
	)
)

rollout MainRollout "Character Modelling Setup" width: 230 height: 320
(
		---Subrollouts
	subRollout SmallRollout width:210 height:1000 pos:[10,10]
	rollout Menu01 "Create Reference Planes"
	(
		button btnCreateFront "Front Ref" pos:[2,8] width:98
		on btnCreateFront pressed do
		(
			plane length: 10 width: 10 lengthsegs:1 widthSegs:1 isSelected:On
			rotate $ (angleaxis 90 [1,0,0])
		
			$.name = "Front Ref"
			createDialog PlaneProp
		)
		
		button btnCreateSide "Side Ref" pos:[100,8] width: 98
		on btnCreateSide pressed do
		(
			plane length: 10 width: 10 lengthsegs:1 widthSegs:1 isSelected:On
			rotate $ (angleaxis -90 [0,1,0])
			rotate $ (angleaxis 90 [1,0,0])
			
			$.name = "Side Ref"
			createDialog PlaneProp
		)
	)
	
	rollout Menu02 "Create Base Primitives"
	(
		button btnCreateHead "Head" pos:[2,8] width:98
		on btnCreateHead pressed do
		(
			box length:1.5 width:1.5 height:1.5 lengthsegs:2 widthsegs:2 heightsegs:2 isSelected:On
			$.name = "Head"
			if $'Front Ref' != undefined then
			(
				$.pos = [0,0,$'Front Ref'.max.z - 1.7]
			)
			createDialog HeadProp
		)
		
		button btnCreateBody "Body" pos:[100,8] width: 98
		on btnCreateBody pressed do
		(
			cylinder radius:1 height:3 sides:12 isSelected:On
			$.name = "Body"
			if $'Front Ref' != undefined then
			(
				$.pos = [0,0,$'Front Ref'.pos.z + 1]
			)
			createDialog BodyProp
		)
		
		button btnCreateArm "Arm" pos:[2,30] width:98
		on btnCreateArm pressed do
		(
			cylinder radius:0.5 height:2.5 sides:8 isSelected:On
			$.name = "Arm"
			if $'Front Ref' != undefined then
			(
				$.pos = [$'Front Ref'.pos.x + 1.5, 0 , $'Front Ref'.pos.z + 1]
			)
			createDialog LimbProp
		)
		
		button btnCreateLeg "Leg" pos:[100,30] width: 98
		on btnCreateLeg pressed do
		(
			cylinder radius:0.5 height:2.5 sides:8 isSelected:On
			$.name = "Leg"
			if $'Front Ref' != undefined then
			(
				$.pos = [$'Front Ref'.pos.x + 1, 0 , $'Front Ref'.min.z + 1]
			)
			createDialog LimbProp
		)
		
		button btnCreateHand "Hand" pos:[2,52] width:98
		on btnCreateHand pressed do
		(
			box length:0.5 width:0.3 height:0.8 lengthsegs:4 widthsegs:1 heightsegs:3 isSelected:On
			$.name = "Hand"
			if $'Front Ref' != undefined then
			(
				$.pos =  [$'Front Ref'.pos.x + 1.5, 0 , $'Front Ref'.pos.z]
			)
			createDialog LimbProp2
		)
		
		button btnCreateFoot "Foot" pos:[100,52] width:98
		on btnCreateFoot pressed do
		(
			box length:2 width:1 height:0.5 lengthsegs:4 widthsegs:2 heightsegs:1 isSelected:On
			$.name = "Foot"
			if $'Front Ref' != undefined then
			(
				$.pos = [$'Front Ref'.pos.x + 1, 0 , $'Front Ref'.min.z]
			)
			createDialog LimbProp2
		)
	
		button btnCreateAll "Create All Body Parts" width:194
		on btnCreateAll pressed do
		(
			if $'Front Ref' != undefined then
			(
				box length:1.5 width:1.5 height:1.5 lengthsegs:2 widthsegs:2 heightsegs:2 isSelected:On
				$.name = "Head"
				$.pos = [0,0,$'Front Ref'.max.z - 1.7]
				
				cylinder radius:1 height:3 sides:12 isSelected:On
				$.name = "Body"
				$.pos = [0,0,$'Front Ref'.pos.z + 1]
				
				cylinder radius:0.5 height:2.5 sides:8 isSelected:On
				$.name = "Arm"
				$.pos = [$'Front Ref'.pos.x + 1.5, 0 , $'Front Ref'.pos.z + 1]
				
				cylinder radius:0.5 height:2.5 sides:8 isSelected:On
				$.name = "Leg"
				$.pos = [$'Front Ref'.pos.x + 1, 0 , $'Front Ref'.min.z + 1]

				box length:0.5 width:0.3 height:0.8 lengthsegs:4 widthsegs:1 heightsegs:2 isSelected:On
				$.name = "Hand"
				$.pos =  [$'Front Ref'.pos.x + 1.5, 0 , $'Front Ref'.pos.z]
			
				box length:2 width:1 height:0.5 lengthsegs:3 widthsegs:2 heightsegs:1 isSelected:On
				$.name = "Foot"
				$.pos = [$'Front Ref'.pos.x + 1, 0 , $'Front Ref'.min.z]

				createDialog AllProp
			)
			else
			(
				messagebox "Please create the front reference"
			)
		)
	)
	
	rollout Menu03 "Create Base Parts"
	(
		--button btnCreateHead "Head" width:98
	)
	
	rollout Menu04 "Other tools"
	(
		button btnSymmetry "Symmetrise" width:98
		on btnSymmetry pressed do
		(
			modPanel.addModToSelection (symmetry ()) ui:on
			modPanel.setCurrentObject $.baseObject
			showendresult = true
			subobjectLevel = 0
		)
		
		button btnXRay "X-ray" width:98
		on btnXRay pressed do
		(
			actionMan.executeAction 0 "373" 
		)
		
		button btnAttach "Combine" width:98
		on btnAttach pressed do
		(
			objList = getCurrentSelection()
			
			if objList.count > 1 then
			(
				for i in 2 to objList.count do
				(
					objList[1].EditablePoly.attach objList[i] objList[1]
				)
			)
			else
			(
				messagebox "Please select more objects to combine"
			)
		)
	)
	
	on MainRollout open do
	(
		addsubrollout SmallRollout Menu01
		addsubrollout SmallRollout Menu02
		--addsubrollout SmallRollout Menu03
		addsubrollout SmallRollout Menu04
	)
	
)

createDialog MainRollout 
