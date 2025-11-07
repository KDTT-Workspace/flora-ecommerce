import React from 'react'

function Button({string, custom}) {
  return (
    <div className= {`w-full px-4 py-1 select-none ${custom}`}>
        {string}
    </div>
  )
}

export default Button