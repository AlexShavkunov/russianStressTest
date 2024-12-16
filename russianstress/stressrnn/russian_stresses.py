from stressrnn import StressRNN
from stressrnn.constants import F_NAME_ADD_EXCEPTION_DICT

def get_stress(text: str):
    stress_rnn = StressRNN(f_name_add_exception_dict= F_NAME_ADD_EXCEPTION_DICT)
    return stress_rnn.put_stress(text, stress_symbol="'")