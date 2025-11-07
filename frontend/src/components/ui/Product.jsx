import React from 'react'

function Product() {
    return (
        <div className='border-2 w-200px h-full flex flex-col text-center'>
            <div className='h-2/3'>
                Image
            </div>
            <div className='h-1/3'>
                <div>
                    Name
                </div>
                <div>
                    Price
                </div>
            </div>
        </div>
    )
}

export default Product