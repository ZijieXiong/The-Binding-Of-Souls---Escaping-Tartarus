/// @description Insert description here
// You can write your code in this editor
event_inherited();

_health = 50;

b_tree = new BTreeRoot(id);


// --- 
var _selector_root = new BTreeSelector();
var _sequence_chase = new BTreeSequence();
var _chase_in_range = new TaskInstanceInRange(obj_player_main, 100);
var _chase_behave = new TaskChaseInstance(obj_player_main, 2.5, 400, 64);
//var _succeder = new BTreeSucceeder();
//var _hit = new TaskMeleeHitTarget(o_mouse_follower, 1.5);
var _patrol = new TaskPatrolSimple(1, 2);

b_tree.ChildAdd(_selector_root);

_sequence_chase.ChildAdd(_chase_in_range);
_sequence_chase.ChildAdd(_chase_behave);
//_sequence_chase.ChildAdd(_succeder);
//_succeder.ChildAdd(_hit);

_selector_root.ChildAdd(_sequence_chase);
_selector_root.ChildAdd(_patrol);


b_tree.Init();



