<?php
namespace Bookshelf;

use Illuminate\Database\Eloquent\Model;
use Valitron\Validator;

final class Author extends Model
{
    /**
     * Turn off the created_at & updated_at columns
     * @var boolean
     */
    public $timestamps = false;

    /**
     * Fields that can be updated via update()
     * @var array
     */
    protected $fillable = ['name', 'biography'];

    public function books()
    {
        return $this->hasMany('Bookshelf\Book');
    }

    /**
     * Update author with new data
     *
     * @param  arrray $data
     * @return null
     */
    public function update(array $data = [])
    {
        $validator = $this->getValidator($data);
        if (!$validator->validate()) {
            $messages = [];
            foreach ($validator->errors() as $fieldName => $errors) {
                $messages[] = current($errors);
            }
            $message = implode("\n", $messages);
            throw new \Exception($message);
        }

        return parent::update($data);
    }

    /**
     * Retrieve validator for this entity
     *
     * @param  Array $data Data to be validated
     * @return Validator
     */
    public function getValidator($data)
    {
        $validator = new Validator($data);

        $validator->rule('required', 'name');
        $validator->rule('lengthBetween', 'name', 1, 100);

        $validator->labels([
            'name' => 'Name',
        ]);
        
        return $validator;
    }
}
