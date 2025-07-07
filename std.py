import io
import sys
import pydoc
from contextlib import redirect_stdout

def capture_full_help(function_name):
    try:
        func = eval(function_name)
        buffer = io.StringIO()
        
        # Use pydoc.Helper for consistent formatting
        helper = pydoc.Helper(output=buffer)
        helper.help(func)
        
        # Get the formatted help text
        help_text = buffer.getvalue()
        
        # Ensure we have the complete output
        if not help_text.startswith("Help on built-in function"):
            # Fallback to raw docstring if formatting fails
            docstring = func.__doc__ or ""
            help_text = f"Help on built-in function {function_name}:\n\n{function_name}(...)\n    {docstring}"
        
        return help_text
    
    except (NameError, AttributeError) as e:
        return f"Error: {str(e)}"

# Usage
help_text = capture_full_help('dir')
print(help_text)