/// @description Insert description here
// You can write your code in this editor
event_inherited();

//_health = 200;

size_scale = 1;


b_tree = new BTreeRoot(id);


// --- 
var _selector_root = new BTreeSelector();
var _sequence_chase = new BTreeSequence();
var _chase_in_range = new TaskInstanceInRange(obj_player, 500);
var _chase_behave = new TaskChaseInstance(obj_player, 1.8, 400, 250);
var _succeder = new BTreeSucceeder();
var _spell_1 = new TaskSpell1(obj_player, 0.2*60);
var _spell_2 = new TaskSpell2(obj_player, 1*60);
var _check_spell_2 = new TaskCheckSpell(obj_player, 4 );
var _sequence_spell_2 = new BTreeSequence();
var _check_spell_tornado = new TaskCheckSpell(obj_player, 6);
var _spell_tornado = new TaskSpellTornado(obj_player, 1*60);
var _sequence_spell_3 = new BTreeSequence();
//var _patrol = new TaskPatrolSimple(1, 2);
var _selector_spell = new BTreeSelector();

b_tree.ChildAdd(_selector_root);

_sequence_spell_3.ChildAdd(_check_spell_tornado);
_sequence_spell_3.ChildAdd(_spell_tornado);

_sequence_spell_2.ChildAdd(_check_spell_2);
_sequence_spell_2.ChildAdd(_spell_2);


_selector_spell.ChildAdd(_sequence_spell_3);
_selector_spell.ChildAdd(_sequence_spell_2);
_selector_spell.ChildAdd(_spell_1);

_sequence_chase.ChildAdd(_chase_in_range);
_sequence_chase.ChildAdd(_chase_behave);
//_sequence_chase.ChildAdd(_succeder);
//_succeder.ChildAdd(_hit);
_sequence_chase.ChildAdd(_selector_spell);

_selector_root.ChildAdd(_sequence_chase);
//_selector_root.ChildAdd(_patrol);


b_tree.Init();

enum LORD_STATE {
    IDLE,
    WALK,
	CAST
}

// Initial state
current_state = LORD_STATE.IDLE;

